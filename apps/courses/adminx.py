# -*- coding: utf-8 -*-
# __author__ = 'apolo'
# _date_ = '2017/11/29 下午11:05'

import xadmin
from .models import Course, Lesson, Video, CourseResource, BannerCourse


class LessonInline(object):
    model = Lesson
    extra = 0


class CourseResourceInline(object):
    model = CourseResource
    extra = 0


class CourseAdmin(object):
    list_display = ['name', 'course_org', 'teacher', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums',
                    'click_nums', 'add_time', 'get_lesson_nums', 'get_link']
    search_fields = ['name', 'course_org', 'teacher', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums',
                     'click_nums']
    list_filter = ['name', 'course_org__name', 'teacher', 'desc', 'detail', 'degree', 'learn_times', 'students',
                   'fav_nums', 'click_nums', 'add_time']
    list_editable = ['degree', 'desc']
    ordering = ['-click_nums']
    readonly_fields = ['click_nums']
    exclude = ['fav_nums']
    inlines = [LessonInline, CourseResourceInline]
    refresh_times = [3,5]

    def queryset(self):
        result = super(CourseAdmin, self).queryset()
        result = result.filter(is_banner=False)
        return result


class BannerCourseAdmin(object):
    list_display = ['name', 'course_org', 'teacher', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums',
                    'click_nums', 'add_time']
    search_fields = ['name', 'course_org', 'teacher', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums',
                     'click_nums']
    list_filter = ['name', 'course_org__name', 'teacher', 'desc', 'detail', 'degree', 'learn_times', 'students',
                   'fav_nums', 'click_nums', 'add_time']
    ordering = ['-click_nums']
    readonly_fields = ['click_nums']
    exclude = ['fav_nums']
    inlines = [LessonInline, CourseResourceInline]

    def queryset(self):
        result = super(BannerCourseAdmin, self).queryset()
        result = result.filter(is_banner=True)
        return result


class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson__name', 'name', 'add_time']


class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'download', 'add_time']
    search_fields = ['course', 'name', 'download']
    list_filter = ['course__name', 'name', 'download', 'add_time']


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(BannerCourse, BannerCourseAdmin)

xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)
