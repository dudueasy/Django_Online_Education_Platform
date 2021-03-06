# -*- encoding=utf-8 -*-
from __future__ import unicode_literals
from datetime import datetime
from django.db import models
from users.models import UserProfile
from courses.models import Course


# Create your models here.


class UserAsk(models.Model):
    name = models.CharField(max_length=20, verbose_name=u'姓名')
    mobile = models.CharField(max_length=11, verbose_name=u'手机号')
    course_name = models.CharField(max_length=50, verbose_name=u'课程名')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'用户咨询'
        verbose_name_plural = verbose_name


class CourseComments(models.Model):
    user = models.ForeignKey(UserProfile, default=1, verbose_name=u'用户')
    course = models.ForeignKey(Course, default=1, verbose_name=u'课程')
    comments = models.CharField(max_length=20, verbose_name=u'评论')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'课程评论'
        verbose_name_plural = verbose_name


class UserFavorite(models.Model):
    user = models.ForeignKey(UserProfile, default='1', verbose_name=u'用户')
    fav_id = models.IntegerField(default=0, verbose_name=u'数据id')
    fav_type = models.CharField(choices=((1, '课程'), (2, '课程机构'), (3, '讲师')), default=1, max_length=20,
                                verbose_name=u'收藏类型')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'用户收藏'
        verbose_name_plural = verbose_name


class UserMessage(models.Model):
    # 用user的值来对应用户id. user = 0 的时候, 表示群发功能.
    user = models.IntegerField(default=0, verbose_name=u'用户id')
    message = models.CharField(max_length=500, verbose_name=u'消息内容')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')
    has_read = models.BooleanField(default=False, verbose_name=u'是否已读')

    class Meta:
        verbose_name = u'用户消息'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.message



class UserCourse(models.Model):
    user = models.ForeignKey(UserProfile, default='1', verbose_name=u'用户')
    course = models.ForeignKey(Course, default='1', verbose_name=u'课程')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'用户课程'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return '%s : %s' % (self.user, self.course)
