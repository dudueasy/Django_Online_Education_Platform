# -*- coding: utf-8 -*-
# __author__ = 'apolo'
# _date_ = '2017/12/22 下午10:28'
from __future__ import unicode_literals


from django import forms
from captcha.fields import CaptchaField
from .models import UserProfile, EmailVerifyRecord


class RegisterForm(forms.Form):
    email = forms.EmailField(required=True,error_messages={'invalid':'用户名或密码错误'})
    password = forms.CharField(required=True, min_length=5, error_messages={'invalid':'用户名或密码错误'})
    captcha = CaptchaField(error_messages={'invalid':u'验证码错误'})

class ModifyPwdForm(forms.Form):
    password1 = forms.CharField(required=True, min_length=5)
    password2 = forms.CharField(required=True, min_length=5)

class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)


class ForgetForm(forms.Form):
    email = forms.EmailField(required=True, min_length=5)
    captcha = CaptchaField(error_messages={'invalid':u'验证码错误'})


class UploadImageForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['image']

class UserInfoForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['nick_name','birthday','gender','address','mobile']




class EmailVerifyForm(forms.ModelForm):
    class Meta:
        model = EmailVerifyRecord
        fields = ['email']

class EmailVerifyRecordForm(forms.ModelForm):
    class Meta:
        model = EmailVerifyRecord
        fields = ['email','code']
