# -*- coding: utf-8 -*-
__author__ = 'apolo'
_date_ = '2018/2/1 下午4:05'

from django.conf.urls import url, include
from .views import UserInfoView, UploadImageView, UpdatePwdView

urlpatterns = [
    # 用户信息页面
    url(r'^info/$', UserInfoView.as_view(), name='user_info'),

    # 用户头像上传
    url(r'^image/upload/$', UploadImageView.as_view(), name='image_upload'),

    # 个人中心修改密码
    url(r'^update/pwd/$', UpdatePwdView.as_view(), name='update_pwd'),

]