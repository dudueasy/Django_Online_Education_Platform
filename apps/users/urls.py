# -*- coding: utf-8 -*-
__author__ = 'apolo'
_date_ = '2018/2/1 下午4:05'

from django.conf.urls import url, include
from .views import (UserInfoView, UploadImageView, UpdatePwdView, SendEmailCodeView,
                    UpdateEmailView, MyCourseView,MyFavOrgView, MyFavTeacherView, MyFavCourseView )

urlpatterns = [
    # 用户信息页面
    url(r'^info/$', UserInfoView.as_view(), name='user_info'),

    # 用户头像上传
    url(r'^image/upload/$', UploadImageView.as_view(), name='image_upload'),

    # 个人中心修改密码
    url(r'^update/pwd/$', UpdatePwdView.as_view(), name='update_pwd'),

    # 个人中心获取验证码
    url(r'^sendemail_code/$', SendEmailCodeView.as_view(), name='sendemail_code'),

    # 个人中心修改邮箱
    url(r'^update_email/$', UpdateEmailView.as_view(), name='update_email'),

    #  我的课程
    url(r'^mycourse/$', MyCourseView.as_view(), name='mycourse'),

    #--- 我的收藏子页面---
    ##  个人中心收藏的机构
    url(r'^myfav/org/$', MyFavOrgView.as_view(), name='myfav_org'),
    ##  个人中心收藏的教师
    url(r'^myfav/teacher/$', MyFavTeacherView.as_view(), name='myfav_teacher'),
    ##  个人中心收藏的课程
    url(r'^myfav/course/$', MyFavCourseView.as_view(), name='myfav_course'),

    # --- 我的收藏子页面结束---

]
