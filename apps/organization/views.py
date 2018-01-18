# _*_ encoding:utf-8 _*_
from __future__ import unicode_literals

import json

from django.shortcuts import render, render_to_response
from django.views.generic import View
from django.http import HttpResponse

from .models import CourseOrg, CityDict
from courses.models import Course
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from .forms import UserAskForm
from operation.models import UserFavorite


# Create your views here.


class OrgView(View):
    # 课程机构列表页面
    def get(self, request):

        # 从数据库获得的数据
        all_orgs = CourseOrg.objects.all()
        all_citys = CityDict.objects.all()
        ## 热门机构
        hot_orgs = all_orgs.order_by('-click_num')[:3]

        # 从get请求获得的数据
        city_id = request.GET.get('city', '')
        category = request.GET.get('category', '')
        sort = request.GET.get('sort', '')

        # 机构排序
        if sort:
            all_orgs = all_orgs.order_by("-%s" % (sort))

        # 城市名筛选功能
        if city_id:
            all_orgs = all_orgs.filter(city_id=int(city_id))
        if category:
            all_orgs = all_orgs.filter(category=category)

        org_nums = all_orgs.count()

        # 对课程机构进行分页
        try:
            page = int(request.GET.get('page', 1))
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_orgs, per_page=5, request=request)

        orgs = p.page(page)

        return render(request, 'org-list.html', {
            'all_orgs': orgs,
            'all_citys': all_citys,
            'org_nums': org_nums,
            'city_id': city_id,
            'category': category,
            'hot_orgs': hot_orgs,
            'sort': sort,
        })


class AddUserAskView(View):
    '''用户提交咨询'''

    def post(self, request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)
            return HttpResponse(json.dumps({'status': 'success'}), content_type='application/json')

        else:
            return HttpResponse(json.dumps({'status': 'fail', 'msg': '添加出错'}), content_type='application/json')


class OrgHomeView(View):
    '''机构首页'''

    def get(self, request, org_id):
        has_fav = False

        current_page = 'home'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()[:3]
        all_teachers = course_org.teacher_set.all()[:1]

        if request.user.is_authenticated():
            if UserFavorite.objects.filter(fav_id=course_org.id, fav_type=2):
                has_fav = True

        return render(request, 'org-detail-homepage.html', {
            'all_courses': all_courses,
            'all_teacher': all_teachers,
            'course_org': course_org,
            'current_page': current_page,
            'has_fav': has_fav,
        })


class OrgCourseView(View):
    '''机构课程页'''

    def get(self, request, org_id):
        current_page = 'course'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()

        # 判断该机构是否已被用户收藏过
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(fav_id=course_org.id, fav_type=2):
                has_fav = True

        return render(request, 'org-detail-course.html', {
            'all_courses': all_courses,
            'course_org': course_org,
            'current_page': current_page,
            'has_fav':has_fav,
        })


class OrgDescView(View):
    '''机构课程页'''

    def get(self, request, org_id):
        current_page = 'desc'
        course_org = CourseOrg.objects.get(id=int(org_id))

        # 判断该机构是否已被用户收藏过
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(fav_id=course_org.id, fav_type=2):
                has_fav = True

        return render(request, 'org-detail-desc.html', {
            'course_org': course_org,
            'current_page': current_page,
            'has_fav' :has_fav,
        })


class OrgTeacherView(View):
    '''机构课程页'''

    def get(self, request, org_id):
        current_page = 'teacher'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_teachers = course_org.teacher_set.all()

        # 判断该机构是否已被用户收藏过
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(fav_id=course_org.id, fav_type=2):
                has_fav = True

        return render(request, 'org-detail-teachers.html', {
            'course_org': course_org,
            'current_page': current_page,
            'all_teachers': all_teachers,
            'has_fav':has_fav,
        })


class AddFavView(View):
    '''用户收藏和取消收藏'''

    def post(self, request):
        fav_id = request.POST.get('fav_id', '')
        fav_type = request.POST.get('fav_type', '0')
        fav_id = request.POST.get('fav_id', '0')
        fav_id = int(fav_id)
        fav_type = int(fav_type)
        user = request.user

        if not request.user.is_authenticated():
            # 判断用户登录状态
            return HttpResponse(json.dumps({"status": "fail", "msg": "用户未登录"}),content_type='application/json')
        else:
            exist_records = UserFavorite.objects.filter(user=user, fav_id=fav_id, fav_type=fav_type)
            # 判断用户是否已经收藏过同类型, 同id的对象

            if exist_records:
                # 如果收藏记录已经存在, 则表示用户取消收藏
                exist_records.delete()
                return HttpResponse(json.dumps({'status': 'success', 'msg': '取消收藏'}), content_type='application/json')

            else:
                # 如果记录不存在, 那么我们添加一条记录
                userfavorite = UserFavorite()

                if fav_id > 0 and fav_type > 0:
                    userfavorite.fav_type = fav_type
                    userfavorite.fav_id = fav_id
                    userfavorite.user = user
                    userfavorite.save()
                    return HttpResponse(json.dumps({'status': 'success', 'msg': '已收藏'}),
                                        content_type='application/json')

                else:
                    return HttpResponse(json.dumps({'status': 'fail', 'msg': '收藏出错'}), content_type='application/json')
