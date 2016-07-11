# coding: utf-8

from __future__ import unicode_literals
from django.db import models

class BasicModel(models.Model):
	nome = models.CharField(max_length=120)
	descricao = models.TextField(blank=True,null=True)
	slug = models.CharField(max_length=240, default='_', blank=True,null=True)
	excluido = models.BooleanField(help_text='Marque esta opção se quiser excluir o item')

	def __unicode__(self):
		return self.nome
	def save(self):
		self.slug = self.nome.replace(' ','-').lower()
		models.Model.save(self)

	class Meta:
		abstract = True;		

class Status(BasicModel):

	def __unicode__(self):
		return 'Status: '+self.nome	

	class Meta:
		verbose_name_plural = "Status"
		verbose_name = "Status"

class Fase(BasicModel):

	def __unicode__(self):
		return 'Fase: '+self.nome

class Tipo(BasicModel):

	def __unicode__(self):
		return 'Tipo: '+self.nome

class Papel(BasicModel):

	def __unicode__(self):
		return 'Papel: '+self.nome

	class Meta:
		verbose_name_plural = "Papéis"
		verbose_name = "Papel"

class Pessoa(BasicModel):
	email = models.EmailField(max_length=256)
	papel = models.ForeignKey(Papel)

	def __unicode__(self):
		return 'Pessoa: '+self.nome

class Responsavel(Pessoa):	
	cargo = models.CharField(max_length=120)
	matricula = models.CharField(max_length=256, null=True,blank=True)
	
	def __unicode__(self):
		return 'Responsavel: '+self.nome

	class Meta:
		verbose_name_plural = "Responsáveis"
		verbose_name = "Responsável"


class Projeto(BasicModel):	
	fase = models.ForeignKey('Fase')
	responsavel = models.ForeignKey('Responsavel', related_name='Pessoa')
	solicitante = models.ForeignKey('Pessoa')

	def __unicode__(self):
		return self.nome

class Midia(BasicModel):
	path = models.CharField(max_length=128)
	mime_type = models.CharField(max_length=128, blank=True, null=True)

	def __unicode__(self):
		return "Midia: "+self.nome

class Documentacao(BasicModel):	
	midia = models.ForeignKey(Midia,blank=True)
	tipo = models.ForeignKey(Tipo)
	projeto = models.ForeignKey(Projeto, blank=True)	

	def __unicode__(self):		
		return "Documentacao: "+self.nome

	class Meta:
		verbose_name = 'Documentação'
		verbose_name_plural = 'Documentações'

class Equipe(BasicModel):
	integrante = models.ManyToManyField(Responsavel)

	def __unicode__(self):
		return 'Equipe: '+self.nome