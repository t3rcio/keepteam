# encoding: utf-8

from __future__ import unicode_literals
from django.db import models
from django import forms
from comum.models import Tipo, Projeto, Status, Responsavel

PERIODICIDADE = (
	('SEGUNDOS','SEGUNDOS'),
	('MINUTOS','MINUTOS'),
	('HORAS','HORAS'),
	('DIAS','DIAS'),
	('SEMANAS','SEMANAS'),
	('MESES','MESES'),
	)
DRIVERS = (
	('SQLSERVER','SQLSERVER'),
	('MYSQL','MYSQL'),
	('POSTRESQL','POSTRESQL')
	)
STATUS = (
    ('HABILITADO','HABILITADO'),
    ('DESABILITADO','DESABILITADO')
)
TIPOS_TAREFAS = (
    ('SHELL','SHELL'),
    ('PYTHON','PYTHON')
)
class BasesDeDados(models.Model):	
	descricao = models.CharField(max_length=128)
	host = models.CharField(max_length=128)
	usuario = models.CharField(max_length=128)
	senha = models.CharField(max_length=128)
	base = models.CharField(max_length=128)
	driver = models.CharField(max_length=128,choices=DRIVERS)

	def __unicode__(self):
		return "Base de Dados: "+self.descricao

	class Meta:
		verbose_name = 'Base de dados'
		verbose_name_plural = 'Bases de Dados'


class Cronograma(models.Model):
	descricao = models.CharField(max_length=120)
	data_inicio = models.DateTimeField(help_text='Data início do cronograma')
	data_fim = models.DateTimeField(help_text='Data final do cronograma')	
	projeto = models.ForeignKey(Projeto, help_text='Projeto para o qual este cronograma será aplicado')
	status = models.ForeignKey(Status,help_text='Em que status este cronograma se encontrada')
	excluido = models.BooleanField(help_text='Excluir cronograma. Cronogramas excluido não são considerados')

	def __unicode__(self):
		return 'Cronograma: '+self.descricao

class Bot(models.Model):
    descricao = models.TextField(help_text='Descreva o objetivo e breve funcionamento do bot')
    arquivo = models.FileField(upload_to='uploads/bots/')

    def repr(self):
    	return self.arquivo.__str__()

    def __unicode__(self):
    	return self.arquivo.__str__()


class Cron(models.Model):
    descricao = models.CharField(max_length=120, help_text='Descrição do que o comando deve executar')
    codigo_a_rodar = models.TextField(help_text='Código a ser executado pelo Agendador. EXPERIMENTAL: NÃO IMPLEMENTADO AINDA!', null=True, blank=True)    
    bot = models.ForeignKey(Bot,null=True,blank=True,help_text='Selecione e suba o script que deve rodar')
    tipo_codigo = models.CharField(choices=TIPOS_TAREFAS,max_length=128)
    data_inicio = models.DateTimeField(help_text='Quando o comando deve ser rodado?')
    repetir = models.BooleanField(help_text='O comando deve ser repetido?')
    repeticoes = models.IntegerField(help_text='Caso o comando seja recorrente, quantas vezes o comando deve rodar?', blank=True,null=True)
    repetir_a_cada = models.IntegerField(help_text='A cada quanto tempo o comando deve ser repetido', blank=True, null=True)
    periodicidade = models.CharField(max_length=128,choices=PERIODICIDADE,help_text='Periodicidade do comando a ser executado', blank=True, null=True)    
    status = models.CharField(choices=STATUS,max_length=128)
    responsavel = models.ForeignKey(Responsavel, help_text='Responsável pela tarefa agendada')
    base_de_dados = models.ForeignKey(BasesDeDados, blank=True, null=True, help_text='EXPERIMENTAL: NÃO IMPLEMENTADO AINDA.')
    sucesso = models.NullBooleanField(help_text='Se a tarefa foi executada com sucesso pelo Agendador', blank=True, null=True)    
    saida = models.TextField(help_text='Saida do comando/script executado', blank=True, null=True)
    problemas = models.TextField(help_text='Possiveis problemas com a tarefa', blank=True, null=True)
    excluido = models.BooleanField(help_text='Excluir atividade agendada')

    def __unicode__(self):
        return 'Cron: '+self.descricao

	def save(self):
		if self.excluido is True:
			#Desabilita o comando agendado caso se excluido
			self.status = 'DESABILITADO'
		models.Model.save(self)