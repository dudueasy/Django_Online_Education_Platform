# -*- coding: utf-8 -*-
from __future__ import unicode_literals

__author__ = 'apolo'
_date_ = '2018/1/17 上午10:19'

import json

from django.shortcuts import render, render_to_response
from django.views.generic import View
from django.http import HttpResponse
from django.db.models import Q
from operation.models import UserFavorite, CourseComments, UserCourse
from utils.mixin_utils import LoginRequiredMixin

from .models import Course, Video
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger


# Create your views here.
# 课程列表
class CourseListView(View):
    def get(self, request):
        search_keyword = request.GET.get('keywords')
        if search_keyword:
            all_courses = Course.objects.filter(Q(name__icontains=search_keyword) |
                                                Q(desc__icontains=search_keyword) |
                                                Q(detail__icontains=search_keyword) |
                                                Q(category__icontains=search_keyword)
                                                )

        # 从数据库获得的数据
        else:
            all_courses = Course.objects.all()

        sort = request.GET.get('sort', '')
        hot_courses = Course.objects.all().order_by('-click_nums')[:3]

        # 开始排序逻辑
        if not sort:
            sort = 'add_time'

        all_courses = all_courses.order_by("-%s" % (sort))

        # 开始分页逻辑
        try:
            page = int(request.GET.get('page', 1))
        except PageNotAnInteger:
            page = 1

        # per_page参数设置每页显示的对象个数.
        p = Paginator(all_courses, per_page=6, request=request)

        courses = p.page(page)

        return render(request, 'course-list.html', {
            "all_course": courses,
            'sort': sort,
            'hot_courses': hot_courses,
        })


class CourseDetailView(View):
    '''课程详情页'''

    def get(self, request, course_id):

        course_has_fav = False
        courseorg_has_fav = False

        current_course = Course.objects.get(id=int(course_id))
        current_course.click_nums += 1
        current_course.save()

        # 展示机构收藏按钮状态
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(fav_id=current_course.course_org.id, fav_type=2):
                courseorg_has_fav = True

                # 展示课程收藏按钮状态
            if UserFavorite.objects.filter(fav_id=current_course.id, fav_type=1):
                course_has_fav = True

        tag = current_course.tag
        if tag:
            related_courses = Course.objects.filter(tag=tag).exclude(id=course_id)
            related_courses = related_courses[:1]
        else:
            related_courses = []

        return render(request, 'course-detail.html', {
            'course': current_course,
            'related_course': related_courses,
            'courseorg_has_fav': courseorg_has_fav,
            'course_has_fav': course_has_fav,
        })


def get_related_courses(course_id):
    # 通过当前课程id , 获取含有当前课程的所有用户课程信息
    related_user_courses = UserCourse.objects.filter(id=course_id)

    # 获取参加该课程的用户id集合
    related_user_ids = [user_course.user_id for user_course in related_user_courses]

    # 通过用户id集合获取这些用户参加的所有用户课程信息
    related_user_courses = UserCourse.objects.filter(user_id__in=related_user_ids)

    # 取出其中的课程id
    all_user_course_ids = [user_course.course_id for user_course in related_user_courses]
    # 最后获得所有参加了这个课程的用户所参加的其他课程的集合.
    related_courses = Course.objects.filter(id__in=all_user_course_ids)
    related_courses = related_courses.order_by("-click_nums")[:5]

    return related_courses


class CourseInfoView(LoginRequiredMixin, View):
    def get(self, request, course_id):
        # 获得当前页面类型, 用于判断标签的active类
        current_page = 'info'

        related_courses = get_related_courses(course_id)
        current_course = Course.objects.get(id=int(course_id))
        current_course.students += 1
        current_course.save()

        # 关联用户和课程
        user_course = UserCourse.objects.filter(user=request.user, course=current_course)
        if not user_course:
            user_course = UserCourse(user=request.user, course=current_course)
            user_course.save()

        return render(request, 'course-chapter.html', {
            'course': current_course,
            'current_page': current_page,
            'related_courses': related_courses,
        })


class CourseCommentView(LoginRequiredMixin, View):
    def get(self, request, course_id):
        # 获得当前页面类型, 用于判断顶部标签的active类
        current_page = 'comment'

        # 获得当前的课程
        current_course = Course.objects.get(id=int(course_id))

        # 获得当前课程下的所有评论
        all_comment = current_course.coursecomments_set.all()

        # 获得参加了该课程的用户所参加的其他课程 (相关课程)
        related_courses = get_related_courses(course_id)

        # 关联用户和课程
        user_course = UserCourse.objects.filter(user=request.user, course=current_course)
        if not user_course:
            user_course = UserCourse(user=request.user, course=current_course)
            user_course.save()

        return render(request, 'course-comment.html', {
            'course': current_course,
            'current_page': current_page,
            'comments': all_comment,
            'related_courses': related_courses,

        })


class AddCommentsView(View):
    def post(self, request):
        if not request.user.is_authenticated():
            return HttpResponse(json.dumps({"status": "fail", "msg": "用户未登录"}), content_type='application/json')
        else:
            comments = request.POST.get('comments', '')
            course_id = int(request.POST.get('course_id', ''))
            if Course.objects.get(id=course_id) and comments:
                course_comment = CourseComments()
                course = Course.objects.get(id=course_id)

                # 赋给两个外键的值都是数据对象, 而不是键值
                course_comment.user = request.user
                course_comment.course = course

                course_comment.comments = comments
                course_comment.save()

                return HttpResponse(json.dumps({"status": "success", "msg": "添加成功"}),
                                    content_type='application/json')

            else:
                return HttpResponse(json.dumps({"status": "fail", "msg": "添加失败"}), content_type='application/json')


class VideoPlayView(LoginRequiredMixin, View):
    # 视频播放页面
    def get(self, request, video_id):
        # 获得当前页面类型, 用于判断标签的active类
        video = Video.objects.get(id=int(video_id))
        current_course = video.lesson.course
        course_id = current_course.id
        current_page = 'video'

        related_courses = get_related_courses(course_id)

        return render(request, 'course-play.html', {
            'course': current_course,
            'current_page': current_page,
            'related_courses': related_courses,
            'video': video,
        })
