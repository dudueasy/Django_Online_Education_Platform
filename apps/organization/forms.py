# -*- coding: utf-8 -*-
from __future__ import unicode_literals
__author__ = 'apolo'
_date_ = '2018/1/16 上午2:58'

from django import forms
from operation.models import UserAsk
import re


class UserAskForm(forms.ModelForm):
    class Meta:
        model = UserAsk
        fields = ['name', 'mobile', 'course_name']

    def clean_mobile(self):
        '''验证手机号码是否合法'''
        mobile = self.cleaned_data['mobile']
        REGEX_MOBILE = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$"
        p = re.compile(REGEX_MOBILE)
        if p.match(mobile):
            return mobile
        else:
            raise forms.ValidationError(u'手机号码非法', code='mobile_invalid')
