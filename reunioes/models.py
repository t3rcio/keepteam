# encoding: utf-8

from __future__ import unicode_literals
from django.db import models
from comum.models import Projeto

class Reuniao(models.Model):
	titulo = models.CharField(max_length=120)
	descricao = models.TextField()
	data = models.DateTimeField()	
	projeto = models.ForeignKey(Projeto)

	def __unicode__(self):
		return self.titulo
	
	class Meta:
		verbose_name_plural = 'Reuniões'		

