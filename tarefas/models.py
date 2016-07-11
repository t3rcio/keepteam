# encoding: utf-8

from __future__ import unicode_literals
from django.db import models
from comum.models import Fase, Status, Responsavel, Projeto, Tipo

class Tarefa(models.Model):
	
	titulo  = models.CharField(max_length=120)
	descricao  = models.TextField(help_text='Breve descricao da tarefa')	
	#resposta = models.TextField(help_text='Resposta sobre a execução da tarefa', blank=True, null=True)	

	data_previsao = models.DateTimeField(help_text='Data prevista para conclusão da tarefa')
	data_inicio = models.DateTimeField(help_text='Quando a tarefa foi iniciada')
	data_fim = models.DateTimeField(help_text='Quando a tarefa foi concluida', blank=True, null=True)	
	
	status = models.ForeignKey(Status)

	responsavel = models.ForeignKey(Responsavel)
	projeto = models.ForeignKey(Projeto, help_text='Projeto ao qual a tarefa deve ser aplicada')
	excluido = models.BooleanField(help_text='Marque esta opção se quiser excluir a tarefa. Tarefa deixará de ser contabilizada')

	def __unicode__(self):
		return self.titulo

	@staticmethod
	def _get_by_status(status):
		tarefas = Tarefa.objects.filter(status__slug=status)
		if tarefas is not None:
			return tarefas
		else:
			return 0


class Acompanhamento(models.Model):
	tarefa = models.ForeignKey(Tarefa)
	titulo = models.CharField(max_length=128)
	descricao = models.TextField(blank=True,null=True)
	tipo = models.ForeignKey(Tipo)
	responsavel = models.ForeignKey(Responsavel)

	def __unicode__(self):
		return self.titulo
