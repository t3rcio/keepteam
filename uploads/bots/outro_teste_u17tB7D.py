path = '/home/tercio/'
arquivo = ''
lista_arquivos = ['1.log','2.log','3.log','4.log','5.log']
saida = []
for item in lista_arquivos:
    arquivo =  '%s%s' % (path,item)
    if not os.path.isfile(arquivo):
        with open(arquivo, 'w') as f:
            for r in range(1,100):
                f.write('>>> r: %s as %s \n' % (r, datetime.today()))
        saida.append('\nArquivo gravado com sucesso.\n')
        f.close()
    else:
        break    
stdout = ''.join(saida)
