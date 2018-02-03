# -*- encoding=utf-8 -*-
from __future__ import unicode_literals
from datetime import datetime

from django.db import models
from organization.models import CourseOrg, Teacher


# Create your models here.


class Course(models.Model):
    course_org = models.ForeignKey(CourseOrg, verbose_name=u'课程机构', null=True, blank=True)
    name = models.CharField(max_length=50, verbose_name=u'课程名')
    desc = models.CharField(max_length=300, verbose_name=u'课程描述')
    detail = models.TextField(verbose_name=u'课程详情')
    degree = models.CharField(choices=(('cj', '初级'), ('zj', '中级'), ('gj', '高级')), verbose_name=u'课程难度', max_length=20)
    learn_times = models.IntegerField(default=0, verbose_name=u'学习时长(分钟)')
    students = models.IntegerField(default=0, verbose_name=u'学习人数')
    fav_nums = models.IntegerField(default=0, verbose_name=u'收藏')
    image = models.ImageField(upload_to='courses/%Y/%m', verbose_name=u'封面图', max_length=100)
    click_nums = models.IntegerField(default=0, verbose_name=u'点击量')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')
    tag = models.CharField(default='', verbose_name=u'课程标签', max_length=10)
    category = models.CharField(default=u'python developing', max_length=100, verbose_name=u'课程类别')
    teacher = models.ForeignKey(Teacher, verbose_name=u'讲师', null=True, blank=True)
    need_to_know = models.CharField(max_length=300, null=True, blank=True, verbose_name=u'课程须知')
    teacher_hint = models.CharField(max_length=200, null=True, blank=True, verbose_name=u'教师提示')
    is_banner = models.BooleanField(default=False, verbose_name=u'是否轮播')

    class Meta:
        verbose_name = u'课程'
        verbose_name_plural = verbose_name

    def get_grade_display(self):
        # 获取课程难度
        return self.get_degree_display()

    def get_lesson_nums(self):
        # 获取章节/课程 数量
        return self.lesson_set.all().count()

    def get_all_course_lesson(self):
        # 获取所有课程信息
        return self.lesson_set.all()

    def get_learn_users(self):
        # 获取所有用户信息
        return self.usercourse_set.all()[:5]

    def get_course_resources(self):
        # 获取所有课程资源信息
        return self.courseresource_set.all()

    def __unicode__(self):
        return self.name


class Lesson(models.Model):
    course = models.ForeignKey(Course, verbose_name=u'课程')
    name = models.CharField(max_length=100, verbose_name=u'章节名')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'章节'
        verbose_name_plural = verbose_name

    def get_all_videos(self):
        # 获取章节下的所有视频
        return self.video_set.all()

    def __unicode__(self):
        return self.name


class Video(models.Model):
    lesson = models.ForeignKey(Lesson, verbose_name=u'章节')
    name = models.CharField(max_length=100, verbose_name=u'视频名')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')
    url = models.CharField(max_length=400, verbose_name=u'访问地址', default='')
    learn_times = models.IntegerField(default=0, verbose_name=u'学习时长(分钟)')

    class Meta:
        verbose_name = u'视频'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


class CourseResource(models.Model):
    course = models.ForeignKey(Course, verbose_name=u'课程')
    name = models.CharField(max_length=100, verbose_name=u'资源名称')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')
    download = models.FileField(upload_to='course/resource/%Y/%m', verbose_name=u'资源文件', max_length=100)

    class Meta:
        verbose_name = u'课程资源'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name
