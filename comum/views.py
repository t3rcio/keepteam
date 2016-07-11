# coding: utf-8
from django.shortcuts import render
from tarefas.models import Tarefa
from comum.models import *


def home(request):
	tarefas = {}
	tarefas_em_aberto = Tarefa._get_by_status('em_andamento')	
	tarefas_concluidas = Tarefa._get_by_status('concluido')
	tarefas_pendentes_drt = Tarefa._get_by_status('pendentes_drt')
	tarefas_pendentes_usuario = Tarefa._get_by_status('pendentes_usuario')	
	return render(request,'home.html',{
		'abertas':tarefas_em_aberto,
		'concluidas':tarefas_concluidas,
		'pendentes_drt':tarefas_pendentes_drt,
		'pendentes_usuario':tarefas_pendentes_usuario
		})

def documentos(request):
	documentos = Documentacao.object.all()
	return render(request,'documentos.html',{'documentos':documentos})

def projetos(request,projeto_slug):	
	projeto = Projeto.objects.get(slug=projeto_slug)
	return render (request,'projeto.html',{'projeto':projeto})

def documentacoes(request,projeto_slug):
	documentos = Documentacao.objects.filter(projeto__slug=projeto_slug)
	return render(request,'documentos.html',{'documentos':documentos})
