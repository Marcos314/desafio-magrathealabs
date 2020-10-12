# Imports
import psycopg2 as psy
import pandas as pd
import sys
import os
import sh
import csv


# def cleaning(path):

#     files = [f for f in os.listdir(path) if f.endswith('.csv')]

    
#     for file in files:        
#         filename = os.fsdecode(file)

#         print(f'----- File: {filename} -----\n ')        
           
#         reader = csv.reader(filename, delimiter=';')
#         # Ignorando o cabeçalho
#         head = next(reader)
#         reader = csv.reader(filename)
#         #sh.sed("-i", "s/\"//g", path+'/'+filename)   #Remover aspas duplas

def upload_to_database(cur, conn, path):

    try:

        files = [f for f in os.listdir(path) if f.endswith('.csv')]
        
        for file in files:
            filename = os.fsdecode(file)

            print(f'----- Inserindo: {filename} -----\n ')

            if (file.startswith('EXP')):
                table_name = 'exportacao'            
            else:
                table_name = 'importacao'
        
            with open(path +'/'+ file, 'r') as file:
                
                next(file) # Ignona o cabeçalho.    

                cur.copy_from(file, table_name, sep=';')

            conn.commit()

    except psy.Error as e:
        print("Não foi possivel enviar os dados")
        print(e)


def main():

    """ A função main será responsável por fornecer as configurações necessárias para a realização da 
        conexão com o postgreSQL """    

    conn = psy.connect("host='localhost' dbname=dadospublicos user=postgres password='postgres123'")
    cur = conn.cursor()
    
    path = '/home/marcos/Desktop/desafio-magrathealabs/dados'

    #cleaning(path)
    upload_to_database(cur,conn, path)

    conn.close()

if __name__ == '__main__':
    main()



