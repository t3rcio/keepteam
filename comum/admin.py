# encoding: utf-8
from django.contrib import admin
from comum.models import *

class BasicModelAdmin(admin.ModelAdmin):
	list_display = ['nome','descricao']

class ProjetoAdmin(admin.ModelAdmin):
	list_display = ['nome','descricao','responsavel']

class ResponsavelAdmin(admin.ModelAdmin):
	list_display = ['nome','email','cargo']

class StatusAdmin(BasicModelAdmin):
	pass

class FaseAdmin(BasicModelAdmin):
	pass

class PapelAdmin(BasicModelAdmin):
	pass

class TipoAdmin(BasicModelAdmin):
	pass

class PessoaAdmin(admin.ModelAdmin):
	list_display = ['nome','email','papel']

class DocumentacaoAdmin(admin.ModelAdmin):
	list_display = ['nome','descricao','projeto']

class MidiaAdmin(admin.ModelAdmin):
	list_display = ['descricao']

class EquipeAdmin(admin.ModelAdmin):
	list_display = ['nome']

admin.site.register(Midia,MidiaAdmin)
admin.site.register(Documentacao,DocumentacaoAdmin)
admin.site.register(Projeto,ProjetoAdmin)
admin.site.register(Responsavel,ResponsavelAdmin)
admin.site.register(Status,StatusAdmin)
admin.site.register(Fase,FaseAdmin)
admin.site.register(Papel,PapelAdmin)
admin.site.register(Tipo,TipoAdmin)
admin.site.register(Pessoa,PessoaAdmin)
admin.site.register(Equipe, EquipeAdmin)