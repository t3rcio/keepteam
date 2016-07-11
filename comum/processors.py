from comum.models import *

def projetos(request):
	projetos = Projeto.objects.all()
	return {'projetos':projetos}

def documentos(request):
	documentos = Documentacao.objects.all()	
	return {'documentos':documentos}