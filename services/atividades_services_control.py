# coding: utf-8
'''
About this daemon code...
Details in: http://stackoverflow.com/questions/16420092/how-to-make-python-script-run-as-service
This running under supervisorclt
'''
import sys
import traceback
import os
import time
import imaplib
import email
import getpass

import logging
from datetime import datetime, timedelta


def setup_environment():
    '''
    Configuracao para rodar ambiente Django
    '''
    pathname = os.path.dirname(sys.argv[0])
    sys.path.append(os.path.abspath(pathname))
    sys.path.append(os.path.normpath(os.path.join(os.path.abspath(pathname), '../')))
    os.environ['DJANGO_SETTINGS_MODULE'] = 'atividades.settings'

setup_environment()

import django
from django.utils import timezone
from django.core.mail import send_mail
django.setup()

from cron.models import *
from comum.models import *

logging.basicConfig(filename='./dsibot.log',level=logging.INFO)
logging.basicConfig(filename='./dsibot.error',level=logging.ERROR)
class DSIBot:
    def run(self):
        while 1:
            try:
                bots_path = '/home/tercio/Projetos/Python/Django/atividades/'
                stack_trace = ''   
                stdout = ''             
                crons_ativos = Cron.objects.filter(status='HABILITADO')
                if len(crons_ativos) > 0:
                    for cron in crons_ativos:
                        logging.info('>>> Examinando cron: %s' % (cron.descricao))
                        if cron.data_inicio.strftime('%Y-%m-%d@%H:%M:%S') == timezone.now().strftime('%Y-%m-%d@%H:%M:%S'):
                            logging.info('>>> Cron ativo encontrado...: %s' % (cron.data_inicio,))                                            
                            if cron.bot is not None:
                                if cron.tipo_codigo == 'PYTHON':
                                    logging.info('>>> [%s] Rodando codigo python no arquivo: %s', (datetime.datetime.today(),cron.bot.arquivo,))
                                    try:
                                        execfile('%s/%s' % (bots_path, cron.bot.arquivo))
                                    except:
                                        logging.error('>>> [%s]-[SCRIPT PYTHON - ERROR] %s' % (datetime.today(),stack_trace,))
                                        stack_trace = traceback.format_exc()                                    
                                elif cron.tipo_codigo == 'SHELL':
                                    logging.info('>>> [%s]-[EXPERIMENTAL! Nao implementado ainda...] Rodando codigo shell script no arquvo: %s/%s', (datetime.today(),bots_path,cron.bot.arquivo))
                            elif cron.codigo_a_rodar and cron.tipo_codigo == 'PYTHON':
                                try:                                                                
                                    logging.info(">>>[%s]-Rodando codigo 'embutido' no cron ..." % (datetime.today(),))
                                    exec(cron.codigo_a_rodar)
                                except:
                                    logging.error('>>>[%s]-[CODIGO EMBUTIDO - ERROR] %s' % (datetime.today(),stack_trace,))
                                    stack_trace = traceback.format_exc()
                            if cron.repetir:
                                if cron.repeticoes > 0:
                                    if cron.periodicidade == 'SEGUNDOS':
                                        cron.data_inicio += timedelta(seconds=cron.repetir_a_cada)
                                    elif cron.periodicidade == 'MINUTOS':
                                        cron.data_inicio += timedelta(minutes=cron.repetir_a_cada)
                                    elif cron.periodicidade == 'HORAS':
                                        cron.data_inicio += timedelta(hours=cron.repetir_a_cada)
                                    elif cron.periodicidade == 'DIAS':
                                        cron.data_inicio += timedelta(days=cron.repetir_a_cada)
                                    elif cron.periodicidade == 'SEMANAS':
                                        cron.data_inicio += timedelta(weeks=cron.repetir_a_cada)
                                    elif cron.periodicidade == 'MESES':
                                        cron.data_inicio += timedelta(weeks=(cron.repetir_a_cada*4))
                                    cron.repeticoes -= 1
                                    cron.save()
                                    continue
                                else:
                                    cron.repetir = False # desabilita a repeticao depois de rodar todas as repeticoes
                                    cron.status = 'DESABILITADO' # desabilita o agendamento                                                                
                            else:
                                cron.status = 'DESABILITADO'                            
                            if stack_trace is '':
                                cron.sucesso = True
                                cron.problemas = ''
                                cron.saida = stdout
                                send_mail('Tarefa agendada completada com sucesso','A tarefa %s foi completada com sucesso.' % (cron.descricao), 'hall9000@ifpi.edu.br',['tercio@ifpi.edu.br'])
                            else:
                                cron.sucesso = False                            
                                cron.problemas = stack_trace
                                send_mail('Tarefa agendada falhou!',
                                      'A tarefa %s não foi completada devido a erros de execução. Segue um stack trace para verificação\n%s' % (cron.descricao, stack_trace,),
                                      'hall9000@ifpi.edu.br', ['tercio@ifpi.edu.br'])
                            cron.save()                 
                            #@todo: criar motor de envio de email com confirmacao do sucesso/falha do script
                else:
                    #logging.info('>>> [%s]-Aguardando novos Crons...' % (datetime.today(),))
            except Exception:
                #@todo: criar motor de envio de email com confirmacao do sucesso/falha do script
                logging.error('>>> [%s]-Ocorreu um erro: \n %s' , (datetime.today(),traceback.format_exc()))
                cron.problemas = traceback.format_exc()
                cron.sucesso = False
                cron.repetir = False
                cron.status = 'DESABILITADO'
                cron.save()                        
        time.sleep(0.5)

    def reading_mail(self):


if __name__ == "__main__":
    bot = DSIBot()
    bot.run()