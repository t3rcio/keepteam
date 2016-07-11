# -*- coding: utf-8 -*-
# Generated by Django 1.9.1 on 2016-03-11 19:32
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('cron', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='BasesDeDados',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('descricao', models.CharField(max_length=128)),
                ('host', models.CharField(max_length=128)),
                ('usuario', models.CharField(max_length=128)),
                ('senha', models.CharField(max_length=128)),
                ('base', models.CharField(max_length=128)),
            ],
            options={
                'verbose_name': 'Base de dados',
                'verbose_name_plural': 'Bases de Dados',
            },
        ),
        migrations.RenameField(
            model_name='cron',
            old_name='command',
            new_name='commando',
        ),
        migrations.AddField(
            model_name='cron',
            name='base_de_dados',
            field=models.ForeignKey(blank=True, default=None, on_delete=django.db.models.deletion.CASCADE, to='cron.BasesDeDados'),
            preserve_default=False,
        ),
    ]