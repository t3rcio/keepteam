from django.shortcuts import render
from tarefas.models import Tarefa



def get_by_status(request,status):
	print status
	tarefas = Tarefa._get_by_status(status)
	return render(request, 'tarefas.html',{'tarefas':tarefas})


