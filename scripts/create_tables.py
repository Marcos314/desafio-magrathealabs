import psycopg2 as pg

from psycopg2 import sql
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
from sql_queries import create_table_queries, drop_table_queries

import csv
import sys
import os
import sh

# Módulo interno
from sql_queries import create_table_queries, drop_table_queries

def create_database():


    con = pg.connect(dbname='postgres',
        user='postgres', host='35.199.113.132',
        password='postgres123')

    con.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cur = con.cursor()
    cur.execute(sql.SQL("CREATE DATABASE dadospublicos;"))

def drop_tables(cur, conn):

    """Função para realizar a conexão com o postgres e fazer a remoção das tableas existentes"""

    for query in drop_table_queries:
        
        try:
            cur.execute(query)
            conn.commit()
            print("Tabela deletada com sucesso")

        except pg.Error as e:
            print(e)
            print("Não foi possível deletar a tabela")

def create_tables(cur, conn):
    """
    Essa função irá realizar a criação das tabelas no postgreSQL.
    """
    for query in create_table_queries:
        try:            
            cur.execute(query)
            conn.commit()
            print("Tabela criada com sucesso")
        
        except pg.Error as e:
            print(e)
            print("Não foi possível criar a tabela")

def main():

    """ A função main será responsável por fornecer as configurações necessárias para a realização da 
        conexão com o postgreSQL """    

    create_database()

    conn = pg.connect("host='35.199.113.132' dbname=dadospublicos user=postgres password='postgres123'")
    cur = conn.cursor()

    drop_tables(cur,conn)
    create_tables(cur, conn)

    conn.close()


if __name__ == "__main__":
    main()


