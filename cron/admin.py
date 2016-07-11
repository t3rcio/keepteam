#encoding: utf-8

from django.contrib import admin
from cron.models import *

class CronAdmin(admin.ModelAdmin):
	list_display = ['descricao','data_inicio','status','sucesso','saida','problemas','responsavel']

class CronogramaAdmin(admin.ModelAdmin):
	list_display = ['descricao','projeto','data_inicio','data_fim', 'status']

class BaseDeDadosAdmin(admin.ModelAdmin):
	list_display = ['descricao','host']

class BotAdmin(admin.ModelAdmin):
	list_display = ['descricao','arquivo']

admin.site.register(Cron, CronAdmin)
admin.site.register(Cronograma,CronogramaAdmin)
admin.site.register(BasesDeDados,BaseDeDadosAdmin)
admin.site.register(Bot, BotAdmin)