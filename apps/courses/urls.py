# -*- coding: utf-8 -*-
__author__ = 'apolo'
_date_ = '2018/1/17 上午10:19'

from django.conf.urls import url, include
from .views import CourseListView

urlpatterns = [

    url(r'^list/$', CourseListView.as_view(), name='course_list')

]