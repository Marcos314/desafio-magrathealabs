import psycopg2 as psy
import csv
import sys
import os
import sh

# Módulo interno
from sql_queries import create_table_queries, drop_table_queries

def drop_tables(cur, conn):

    """Função para realizar a conexão com o postgres e fazer a remoção das tableas existentes"""

    for query in drop_table_queries:
        
        try:
            print(f'{query}')
            
            cur.execute(query)

            conn.commit()
            print("Tabela deletada com sucesso")

        except psy.Error as e:
            print(e)
            print("Não foi possível deletar a tabela")

def create_tables(cur, conn):
    """
    Essa função irá realizar a criação das tabelas no postgreSQL.
    """
    for query in create_table_queries:
        try:
            print(f'{query}')

            cur.execute(query)
            conn.commit()
            print("Tabela criada com sucesso")
        
        except psy.Error as e:
            print(e)
            print("Não foi possível criar a tabela")

def main():

    """ A função main será responsável por fornecer as configurações necessárias para a realização da 
        conexão com o postgreSQL """    

    conn = psy.connect("host='localhost' dbname=dadospublicos user=postgres password='postgres123'")
    cur = conn.cursor()

    drop_tables(cur,conn)
    create_tables(cur, conn)

    conn.close()



if __name__ == "__main__":
    main()














# conn = psy.connect("host=localhost dbname=exportacao user=postgres")

# cur = conn.cursor()

# cur.execute("""
#     DROP TABLE exportacao;
# """)

# cur.execute("""    
    
#     CREATE TABLE exportacao(
       
#         CO_ANO Integer,
#         CO_MES Integer, 
#         CO_NCM VARCHAR,
#         CO_UNID Integer,
#         CO_PAIS VARCHAR,
#         SG_UF_NCM VARCHAR(2),
#         CO_VIA Integer,
#         CO_URF VARCHAR,
#         QT_ESTAT BIGINT,
#         KG_LIQUIDO BIGINT,
#         VL_FOB BIGINT
#     )

# """)

# with open('../dados/EXP_COMPLETA.csv', 'r') as file:
    
#     next(file) # Ignona o cabeçalho.    

#     cur.copy_from(file, 'exportacao', sep=';')

# conn.commit()


 