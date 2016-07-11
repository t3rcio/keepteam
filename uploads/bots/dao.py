# encoding: utf-8

class DataAccessObject:

    @staticmethod
    def dictfetchall(cursor):
        "Retorna as linhas de um cursor sql em um dicionario"
        columns = [col[0] for col in cursor.description]
        return [
            dict(zip(columns, row))
            for row in cursor.fetchall()
            ]