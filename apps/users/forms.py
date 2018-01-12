# -*- coding: utf-8 -*-
# __author__ = 'apolo'
# _date_ = '2017/12/22 下午10:28'


from django import forms
from captcha.fields import CaptchaField


class RegisterForm(forms.Form):
    email = forms.EmailField(required=True,error_messages={'invalid':'用户名或密码错误'})
    password = forms.CharField(required=True, min_length=5, error_messages={'invalid':'用户名或密码错误'})
    captcha = CaptchaField(error_messages={'invalid':u'验证码错误'})


class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)

