# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-01-15 23:35
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='courseorg',
            name='category',
            field=models.CharField(choices=[('public', 'public'), ('private', 'private'), ('personal', 'personal')], default='public', max_length=20, verbose_name='\u673a\u6784\u7c7b\u522b'),
        ),
    ]