# _*_ encoding:utf-8 _*_

"""OnlineEdu URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.views.generic import TemplateView
from django.views.static import serve
from OnlineEdu.settings import MEDIA_ROOT

from users.views import (LoginView, LogoutView, RegisterView, ActiveUserView,
                         ForgetPwdView, ResetView, ModifyPwdView, IndexView, view_locale)

import xadmin

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    # url(r'^admin/', admin.site.urls),
    url('^$', IndexView.as_view(), name='index'),
    # 用户登录, 登出
    url('^login/$', LoginView.as_view(), name='login'),
    url('^logout/$', LogoutView.as_view(), name='logout'),

    url('^register/$', RegisterView.as_view(), name='register'),
    url(r'^captcha/', include('captcha.urls')),

    # 邮件激活
    url(r'^active/(?P<active_code>\w+)/$', ActiveUserView.as_view(), name='user_active'),
    url(r'^forget/$', ForgetPwdView.as_view(), name='forget_pwd'),
    url(r'^reset/(?P<active_code>\w+)/$', ResetView.as_view(), name='reset_pwd'),
    url(r'^modify_pwd/$', ModifyPwdView.as_view(), name='modify_pwd'),

    # 机构url配置
    url(r'^org/', include('organization.urls', namespace='org')),

    # 课程机构url配置
    url(r'^course/', include('courses.urls', namespace='course')),

    # 用户信息url配置
    url(r'^users/', include('users.urls', namespace='users')),

    # 配置媒体/上传文件的访问处理函数,
    url(r'^media/(?P<path>.*/$)', serve, {"document_root": MEDIA_ROOT}),

    # 用来代理静态的访问处理函数, 在生产模式使用, 在开发模式禁用.
    # from OnlineEdu.settings import STATIC_ROOT
    # url(r'^static/(?P<path>.*/$)', serve, {"document_root": STATIC_ROOT}),

    # 用来检测服务器环境语言的函数
    url(r'^locale/$', view_locale, {}),
]

# 全局404页面配置
handler404 = "users.views.page_not_found"

# 全局500页面配置
handler500 = "users.views.internal_server_error"
