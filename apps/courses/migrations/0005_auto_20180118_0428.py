# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-01-18 04:28
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0004_course_category'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='category',
            field=models.CharField(default='\u540e\u7aef\u5f00\u53d1', max_length=20, verbose_name='\u8bfe\u7a0b\u7c7b\u522b'),
        ),
    ]
