# -*- encoding=utf-8 -*-
from __future__ import unicode_literals
from datetime import  datetime

from django.db import models

# Create your models here.


class CityDict(models.Model):
    name = models.CharField(max_length=20, verbose_name=u'城市名')
    desc = models.CharField(max_length=200, verbose_name=u'描述')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'城市'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name



class CourseOrg(models.Model):
    name = models.CharField(max_length=50, verbose_name=u'机构名')
    desc = models.TextField(verbose_name=u'机构描述')
    click_num = models.IntegerField(default=0, verbose_name=u'点击数')
    fav_num = models.IntegerField(default=0, verbose_name=u'收藏数')
    image = models.ImageField(max_length=100, upload_to='org/%Y/%m' ,verbose_name=u'logo')
    address = models.CharField(max_length=150, verbose_name=u'机构地址')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')
    city = models.ForeignKey(CityDict, verbose_name=u'所在城市')
    category = models.CharField(max_length=20, verbose_name=u'机构类别',choices=(('public','public'),('private','private'),('personal',
    'personal')), default='public')
    students = models.IntegerField(default=0, verbose_name=u'学习人数')
    course_nums = models.IntegerField(default=0, verbose_name=u'课程数')


    class Meta:
        verbose_name = u'课程机构'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name

class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg, verbose_name=u'所属机构')
    name = models.CharField(max_length=50, verbose_name=u'教师')
    work_years = models.IntegerField(default=0, verbose_name=u'工作年限')
    work_company = models.CharField(max_length=50,verbose_name=u'就职公司')
    position = models.CharField(max_length=50, verbose_name=u'工作职位')
    points = models.CharField(max_length=50, verbose_name=u'教学特点')
    click_num = models.IntegerField(default=0, verbose_name=u'点击数')
    fav_num = models.IntegerField(default=0, verbose_name=u'收藏数')
    image = models.ImageField(max_length=100, upload_to='org/teacher/%Y/%m' ,verbose_name=u'头像')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'教师'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


