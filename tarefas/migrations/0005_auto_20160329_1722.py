# -*- coding: utf-8 -*-
# Generated by Django 1.9.1 on 2016-03-29 20:22
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('comum', '0009_auto_20160329_1722'),
        ('tarefas', '0004_auto_20160311_1745'),
    ]

    operations = [
        migrations.CreateModel(
            name='Acompanhamento',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titulo', models.CharField(max_length=128)),
                ('descricao', models.TextField(blank=True, null=True)),
                ('responsavel', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='comum.Responsavel')),
            ],
        ),
        migrations.RemoveField(
            model_name='tarefa',
            name='resposta',
        ),
        migrations.AddField(
            model_name='acompanhamento',
            name='tarefa',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='tarefas.Tarefa'),
        ),
        migrations.AddField(
            model_name='acompanhamento',
            name='tipo',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='comum.Tipo'),
        ),
    ]