#!/bin/bash

# Criação do diretório onde ficarão os arquivos csv
mkdir dados

# Download e descompactação do arquivo csv
wget http://www.mdic.gov.br/balanca/bd/comexstat-bd/ncm/EXP_COMPLETA.zip
unzip EXP_COMPLETA.zip
mv EXP_COMPLETA.csv/dados
rm -rf EXP_COMPLETA.zip

wget http://www.mdic.gov.br/balanca/bd/comexstat-bd/ncm/IMP_COMPLETA.zip
unzip IMP_COMPLETA.zip
mv IMP_COMPLETA.csv/dados
rm -rf IMP_COMPLETA.zip
