# -*- coding: utf-8 -*-
__author__ = 'apolo'
_date_ = '2017/11/29 下午11:48'


import xadmin

from .models import CityDict, CourseOrg,Teacher


class CityDictAdmin(object):

    list_display = ['name', 'desc', 'add_time']
    search_fields = ['name', 'desc']
    list_filter = ['name', 'desc', 'add_time']


class CourseOrgAdmin(object):

    list_display = ['name', 'desc','click_num','fav_nums','address','city', 'category','add_time']
    search_fields = ['name', 'desc','click_num','fav_nums','address','category','city']
    list_filter = ['name', 'desc','click_num','fav_nums','address','category','city__name','add_time']
    relfield_style='fk_ajax'

class TeacherAdmin(object):

    list_display = ['org','name', 'work_years', 'work_company', 'position', 'points', 'click_num', 'fav_nums','add_time']
    search_fields = ['org','name', 'work_years', 'work_company', 'position', 'points', 'click_num', 'fav_nums']
    list_filter = ['org__name','name', 'work_years', 'work_company', 'position', 'points', 'click_num', 'fav_nums','add_time']



xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(Teacher, TeacherAdmin)
