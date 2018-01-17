# -*- coding: utf-8 -*-
__author__ = 'apolo'
_date_ = '2018/1/16 上午2:31'


from django.conf.urls import url, include
from .views import OrgView, AddUserAskView, OrgHomeView, OrgCourseView, OrgDescView, OrgTeacherView, AddFavView

urlpatterns = [
    # 课程机构列表页
    url(r'^list/$', OrgView.as_view(), name='org_list'),
    # 我要学习表单
    url(r'^add_ask/$', AddUserAskView.as_view(), name='add_ask'),

    # 机构详情页
    url(r'^home/(?P<org_id>\d+)/$', OrgHomeView.as_view(),name='org_home'),
    url(r'^course/(?P<org_id>\d+)/$', OrgCourseView.as_view(),name='org_course'),
    url(r'^desc/(?P<org_id>\d+)/$', OrgDescView.as_view(), name='org_desc'),
    url(r'^teacher/(?P<org_id>\d+)/$', OrgTeacherView.as_view(), name='org_teacher'),

    # 机构收藏
    url(r'^add_fav/$', AddFavView.as_view(), name='add_fav')

]