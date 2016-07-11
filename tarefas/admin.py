# encoding: utf-8
from django.contrib import admin
from tarefas.models import *
from comum.models import *

class TarefasAdmin(admin.ModelAdmin):
	list_display = ['titulo', 'responsavel', 'projeto', 'status', 'data_previsao']

admin.site.register(Tarefa, TarefasAdmin)
