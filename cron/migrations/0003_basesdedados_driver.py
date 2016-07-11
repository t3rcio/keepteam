# -*- coding: utf-8 -*-
# Generated by Django 1.9.1 on 2016-03-11 19:39
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cron', '0002_auto_20160311_1632'),
    ]

    operations = [
        migrations.AddField(
            model_name='basesdedados',
            name='driver',
            field=models.CharField(choices=[('SQLSERVER', 'SQLSERVER'), ('MYSQL', 'MYSQL'), ('POSTRESQL', 'POSTRESQL')], default='POSTGRESQL', max_length=128),
            preserve_default=False,
        ),
    ]
