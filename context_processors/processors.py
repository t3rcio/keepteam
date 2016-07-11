from comum.models import *

def projetos(Request):
	projetos = Projeto.objects.all()
	return {'projetos':projetos}
