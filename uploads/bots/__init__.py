# encoding: utf-8
# configurancao do ambiente django
def setup_environment():
    pathname = os.path.dirname(sys.argv[0])
    sys.path.append(os.path.abspath(pathname))
    sys.path.append(os.path.normpath(os.path.join(os.path.abspath(pathname), '../')))
    sys.path.append('/home/tercio/Projetos/Python/Django/atividades/')
    os.environ['DJANGO_SETTINGS_MODULE'] = 'atividades.settings'

setup_environment()

import django
django.setup()

# para facilitar a iteracao em cursores retornados de acesso a bancos de dados
def dictfetchall(cursor):
    "Retorna as linhas de um cursor sql em um dicionario"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
        ]