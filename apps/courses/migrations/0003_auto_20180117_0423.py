# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-01-17 04:23
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0002_course_course_org'),
    ]

    operations = [
        migrations.RenameField(
            model_name='course',
            old_name='des',
            new_name='desc',
        ),
    ]