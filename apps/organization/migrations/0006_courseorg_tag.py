# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-02-03 22:17
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0005_auto_20180203_2032'),
    ]

    operations = [
        migrations.AddField(
            model_name='courseorg',
            name='tag',
            field=models.CharField(default='\u5168\u56fd\u77e5\u540d', max_length=16),
        ),
    ]
