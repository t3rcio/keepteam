# -*- coding: utf-8 -*-
# Generated by Django 1.9.1 on 2016-03-11 20:45
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tarefas', '0003_auto_20160311_1743'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tarefa',
            name='data_fim',
            field=models.DateTimeField(blank=True, help_text='Quando a tarefa foi concluida', null=True),
        ),
        migrations.AlterField(
            model_name='tarefa',
            name='resposta',
            field=models.TextField(blank=True, help_text='Resposta sobre a execu\xe7\xe3o da tarefa', null=True),
        ),
    ]
