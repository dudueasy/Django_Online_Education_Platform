# -*- coding: utf-8 -*-
__author__ = 'apolo'
_date_ = '2018/1/17 上午10:19'

from django.shortcuts import render, render_to_response
from django.views.generic import View
from django.http import HttpResponse
from .models import Course

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger


# Create your views here.

class CourseListView(View):
    def get(self, request):
        sort = request.GET.get('sort', '')
        all_courses = Course.objects.all()
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
    def get(self, request,course_id):
        current_course = Course.objects.get(id = int(course_id))
        current_course.click_nums += 1
        current_course.save()

        return render(request, 'course-detail.html', {
            'course': current_course,
        })
