#!/bin/bash
FROM_ENCODING="iso-8859-1"
TO_ENCODING="UTF-8"


wget http://www.mdic.gov.br/balanca/bd/comexstat-bd/ncm/EXP_COMPLETA.zip
unzip EXP_COMPLETA.zip
mkdir dags/dados
mv EXP_COMPLETA.csv dags/dados/
rm -rf EXP_COMPLETA.zip

wget http://www.mdic.gov.br/balanca/bd/comexstat-bd/ncm/IMP_COMPLETA.zip
unzip IMP_COMPLETA.zip
mkdir dags/dados
mv IMP_COMPLETA.csv dags/dados/
rm -rf IMP_COMPLETA.zip