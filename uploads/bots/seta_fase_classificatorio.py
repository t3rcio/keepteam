
import os, sys, dao

def setup_environment():
    pathname = os.path.dirname(sys.argv[0])
    sys.path.append(os.path.abspath(pathname))
    sys.path.append(os.path.normpath(os.path.join(os.path.abspath(pathname), '../')))
    sys.path.append('/home/tercio/Projetos/Python/Django/atividades/')
    os.environ['DJANGO_SETTINGS_MODULE'] = 'atividades.settings'

setup_environment()
import django
django.setup()

from django.db import connections

#arquivo = '/home/tercio/candidatos.txt'
cursor = connections['classificatorio'].cursor()

if cursor:
    cursor.execute('select * from Candidato')
    result = dao.DataAccessObject.dictfetchall(cursor)
    if result:
        with open(arquivo,'w') as f:
            for r in result:
                f.write('\n'+r['cpf']+'\n')
        f.close()


