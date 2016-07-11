# encoding: utf-8

from __future__ import unicode_literals
from django.db import models

class SecurityConfigs(models.Model):

    class Meta:
        verbose_plural_name = 'Configurações de Segurança'
        verbose_name = 'Configuração de Segurança'






class NotificationsConfigs(models.Model):


    class Meta:
        verbose_plural_name = 'Configurações de Notificações'
        verbose_name = 'Configuração de Nontificação'

