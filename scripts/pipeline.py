# Imports
import psycopg2 as psy
from psycopg2 import sql
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import pandas as pd
import sys
import os
import sh
import csv

# Remoção de aspas duplas que foi observado no dataset
def cleaning(path):

    files = [f for f in os.listdir(path) if f.endswith('.csv')]

    
    for file in files:        
        filename = os.fsdecode(file)

        print(f"----- File: {filename} -----\n ")        
           
        reader = csv.reader(filename, delimiter=';')
        # Ignorando o cabeçalho
        head = next(reader)
        reader = csv.reader(filename)
        #sh.sed("-i", "s/\"//g", path+'/'+filename)   #Remover aspas duplas
        
        if (file.startswith('EXP')):
            db_name = 'exportacao'
            caminho = path+'/'+filename
        elif (file.startswith('IMP')):
            db_name = 'importacao'
            caminho = path+'/'+filename
        else:
            break
        
        #create_database(db_name)
        upload_to_database('localhost',db_name,'postgres', caminho)
        

# Criar databases
def create_database(db_name):

    # Conexao
    con = psy.connect("host= 'localhost' user=postgres password='45l69k'")
    con.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cur = con.cursor()
    
    # Criando uma tablela
    sqlCreateDatabase = "CREATE DATABASE " + db_name + ";" 

    # Create a table in PostgreSQL database

    cur.execute(sqlCreateDatabase)


# Importar o csv para o banco postgres
def upload_to_database(host, dbname, user, path):

    
    conn = psy.connect(f'host={host} dbname=exportacao user={user}')

    cur = conn.cursor()

    cur.execute("""
        
        DROP TABLE IF EXISTS exportacao, importacao;
        
    """)

    cur.execute("""        
            CREATE TABLE {} (            
                ano Integer,
                mes Integer, 
                cod_produto VARCHAR,
                CO_UNID Integer,
                cod_pais VARCHAR,
                uf VARCHAR(2),
                CO_VIA Integer,
                CO_URF VARCHAR,
                QT_ESTAT BIGINT,
                KG_LIQUIDO BIGINT,
                VL_FOB BIGINT
            )
        """.format(dbname)
        )    
    print(path)
    print(dbname)

    with open(path, 'r') as file:
        
        next(file) # Ignona o cabeçalho.    

        cur.copy_from(file, dbname, sep=';')

    conn.commit()


def main():

    path = input('Informe o diretório local dos dados: ')

    cleaning(path)


if __name__ == '__main__':
    main()



