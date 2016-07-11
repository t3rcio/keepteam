# -*- coding: utf-8 -*-
# Generated by Django 1.9.1 on 2016-03-11 19:32
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('comum', '0005_remove_projeto_status'),
    ]

    operations = [
        migrations.CreateModel(
            name='Documentacao',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=120)),
                ('descricao', models.TextField()),
                ('excluido', models.BooleanField(help_text='Marque esta op\xe7\xe3o se quiser excluir o item')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Midia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=120)),
                ('descricao', models.TextField()),
                ('excluido', models.BooleanField(help_text='Marque esta op\xe7\xe3o se quiser excluir o item')),
                ('path', models.CharField(max_length=128)),
                ('mime_type', models.CharField(blank=True, max_length=128, null=True)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AlterModelOptions(
            name='responsavel',
            options={'verbose_name': 'Respons\xe1vel', 'verbose_name_plural': 'Respons\xe1veis'},
        ),
        migrations.AddField(
            model_name='documentacao',
            name='midia',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='comum.Midia'),
        ),
        migrations.AddField(
            model_name='documentacao',
            name='projeto',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='comum.Projeto'),
        ),
        migrations.AddField(
            model_name='documentacao',
            name='tipo',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='comum.Tipo'),
        ),
    ]
