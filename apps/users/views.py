# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import json, locale, sys

from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse

from .models import UserProfile, EmailVerifyRecord, Banner
from .forms import (LoginForm, RegisterForm, ForgetForm,
                    ModifyPwdForm, UploadImageForm, EmailVerifyForm,
                    EmailVerifyRecordForm, UserInfoForm)

from courses.models import Course
from operation.models import UserFavorite, UserMessage
from organization.models import CourseOrg, Teacher
from utils.email_send import send_register_email
from utils.mixin_utils import LoginRequiredMixin
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger


# Create your views here.


class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class ActiveUserView(View):
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()

        else:
            return render(request, 'active_fail.html')
        return render(request, 'login.html')


class ResetView(View):
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                return render(request, 'password_reset.html', {'email': email})
        else:
            return render(request, 'reset_fail.html')


# 更改密码
class ModifyPwdView(View):
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            email = request.POST.get('email', '')
            if pwd1 != pwd2:
                return render(request, 'password_reset.html', {'email': email, 'msg': '密码不一致'})
            else:
                user = UserProfile.objects.get(email=email)
                user.password = make_password(pwd1)
                user.save()
                return render(request, 'login.html')
        else:
            email = request.POST.get('email', '')
            return render(request, 'password_reset.html', {'email': email, 'modify_form': modify_form})
            # return render(request, 'login.html')


class RegisterView(View):
    def get(self, request):
        register_form = RegisterForm()
        return render(request, "register.html", {'register_form': register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get("email", '')
            if UserProfile.objects.filter(email=user_name):
                return render(request, 'register.html', {'register_form': register_form, 'msg': '用户已存在'})

            pass_word = request.POST.get('password', '')
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.is_active = False
            user_profile.password = make_password(pass_word)
            user_profile.save()
            # 写入欢迎注册消息
            user_message = UserMessage()
            user_message.user = user_profile.id
            user_message.message = '欢迎注册小学生在线'
            user_message.save()

            send_register_email(user_name)
            return render(request, 'login.html')

        else:
            return render(request, 'register.html', {'register_form': register_form})


# 登陆页面
class LoginView(View):
    def get(self, request):
        return render(request, 'login.html', {})

    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get("username", '')
            pass_word = request.POST.get('password', '')
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return redirect('index')
                else:
                    return render(request, 'login.html', {"msg": "用户未激活!"})
            else:
                return render(request, 'login.html', {"msg": "用户名或密码错误!", "login_form": login_form})
        else:
            return render(request, 'login.html', {"login_form": login_form})


# 登出页面
class LogoutView(View):
    def get(self, request):
        logout(request)
        return redirect('index')


class ForgetPwdView(View):
    def get(self, request):
        forget_form = ForgetForm()
        return render(request, 'forgetpwd.html', {'forget_form': forget_form})

    def post(self, request):
        forget_form = ForgetForm(request.POST)
        if forget_form.is_valid():
            user_email = request.POST.get("email", '')
            send_register_email(user_email, 'forget')
            return render(request, 'send_success.html')

        else:
            return render(request, 'forgetpwd.html', {'forget_form': forget_form, 'msg': '输入错误'})


# 用户个人信息
class UserInfoView(LoginRequiredMixin, View):
    def get(self, request):
        return render(request, 'usercenter-info.html', {})

    def post(self, request):
        user_info = UserInfoForm(request.POST, instance=request.user)
        if user_info.is_valid():
            user_info.save(commit=True)
            return HttpResponse(json.dumps({'status': 'success'}), content_type='application/json')

        else:
            return HttpResponse(json.dumps(user_info.errors), content_type='application/json')


# 用户头像上传
class UploadImageView(LoginRequiredMixin, View):
    def post(self, request):
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            request.user.save()
            return HttpResponse(json.dumps({"status": "success"}), content_type='application/json')
        else:
            return HttpResponse(json.dumps({"status": "fail"}), content_type='application/json')


# 个人中心修改密码
class UpdatePwdView(View):
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            if pwd1 != pwd2:
                # else:
                return HttpResponse(json.dumps({"status": "fail", 'msg': '密码不一致'}), content_type='application/json')
            else:
                user = request.usr
                user.password = make_password(pwd1)
                user.save()
                return HttpResponse(json.dumps({"status": "success"}), content_type='application/json')
        else:
            return HttpResponse(json.dumps(modify_form.errors), content_type='application/json')


# 发送验证码
class SendEmailCodeView(LoginRequiredMixin, View):
    def get(self, request):
        email_verify_record_form = EmailVerifyForm(request.GET)
        if email_verify_record_form.is_valid():
            email = email_verify_record_form.cleaned_data['email']
            if UserProfile.objects.filter(email=email):
                return HttpResponse(json.dumps({"email": "邮箱已存在"}), content_type='application/json')

            # 异常处理
            try:
                send_register_email(email, send_type="update_email")
            except Exception as e:
                pass
            return HttpResponse(json.dumps({"status": "success"}), content_type='application/json')

        else:
            return HttpResponse(json.dumps({"email": "错误的输入"}), content_type='application/json')


# 更新用户邮箱地址
class UpdateEmailView(LoginRequiredMixin, View):
    def post(self, request):
        email_verify_record_form = EmailVerifyRecordForm(request.POST)
        if email_verify_record_form.is_valid():
            email = email_verify_record_form.cleaned_data['email']
            code = email_verify_record_form.cleaned_data['code']
            exisited_verify_record = EmailVerifyRecord.objects.filter(
                email=email, code=code, send_type='update_email')
            if exisited_verify_record:
                request.user.email = email
                request.user.save()

                return HttpResponse(json.dumps({"status": "success"}), content_type='application/json')

            else:
                return HttpResponse(json.dumps({"email": "验证码错误"}), content_type='application/json')

        else:
            return HttpResponse(json.dumps({"email": "错误的输入"}), content_type='application/json')


# 个人中心-> 我的课程
class MyCourseView(LoginRequiredMixin, View):
    def get(self, request):
        user_courses = request.user.usercourse_set.all()

        return render(request, 'usercenter-mycourse.html', {
            'user_courses': user_courses,
        })


# 个人中心-> 我的收藏 -> 课程机构
class MyFavOrgView(LoginRequiredMixin, View):
    def get(self, request):
        user_fav_objs = UserFavorite.objects.filter(user=request.user, fav_type=2)
        org_list = [CourseOrg.objects.get(id=user_fav.fav_id) for user_fav in user_fav_objs]

        return render(request, 'usercenter-fav-org.html', {
            'org_list': org_list,
        })


# 个人中心-> 我的收藏 -> 授课教师
class MyFavTeacherView(View):
    def get(self, request):
        user_fav_objs = UserFavorite.objects.filter(user=request.user, fav_type=3)
        teacher_list = [Teacher.objects.get(id=user_fav.fav_id) for user_fav in user_fav_objs]

        return render(request, 'usercenter-fav-teacher.html', {
            'teacher_list': teacher_list,
        })


# 个人中心-> 我的收藏 -> 公开课程
class MyFavCourseView(View):
    def get(self, request):
        user_fav_objs = UserFavorite.objects.filter(user=request.user, fav_type=1)
        course_list = [Course.objects.get(id=user_fav.fav_id) for user_fav in user_fav_objs]

        return render(request, 'usercenter-fav-course.html', {
            'course_list': course_list,
        })


# 个人中心-> 我的消息
class MyMessageView(View):
    def get(self, request):
        all_message = UserMessage.objects.filter(user=request.user.id)

        # 用户进入消息页面后清空未读信息.
        all_unread_messages = UserMessage.objects.filter(user=request.user.id, has_read=False)
        for unread_message in all_unread_messages:
            unread_message.has_read = True
            unread_message.save()

        # 对个人消息进行分页
        try:
            page = int(request.GET.get('page', 1))
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_message, per_page=5, request=request)

        message = p.page(page)

        return render(request, 'usercenter-message.html', {
            'message_list': message,
        })


# 网站首页
class IndexView(View):
    def get(self, request):
        # 取出轮播图
        # 获得 Banner Model下的数据
        all_banners = Banner.objects.all().order_by('index')

        # 获得Course Model 下 is_banner 的数据, 和非banner 的数据
        non_banner_courses = Course.objects.filter(is_banner=False)[:6]
        banner_courses = Course.objects.filter(is_banner=True)[:3]

        # 获得15个机构的数据
        course_orgs = CourseOrg.objects.all()[:15]

        return render(request, 'index.html', {
            'all_banners': all_banners,
            'non_banner_courses': non_banner_courses,
            'banner_courses': banner_courses,
            'course_orgs': course_orgs,
        })


# 全局 404 处理函数
def page_not_found(request):
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response


# 500 处理函数
def internal_server_error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response


# 检验环境字符集的方法
def view_locale(request):
    loc_info = "getlocale: " + str(locale.getlocale()) + \
               "<br/>getdefaultlocale(): " + str(locale.getdefaultlocale()) + \
               "<br/>fs_encoding: " + str(sys.getfilesystemencoding()) + \
               "<br/>sys default encoding: " + str(sys.getdefaultencoding())
    "<br/>sys default encoding: " + str(sys.getdefaultencoding())

    return HttpResponse(loc_info)
