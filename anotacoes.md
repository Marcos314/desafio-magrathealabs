## O desafio consiste em duas partes:

1 - Carregamento e armazenamento dos dados

2 - Construção de visualizações dos dados carregados.

**Utilizando a linguagem de sua preferência construa programas para:**

1 - Efetuar o download e carregamento automatizado dos dados em um banco para análise de forma periódica.

**R: Airflow + Google Colab + PostgresSQL + Databricks Community**

2 - Realizar uma rotina de verificação de qualidade dos dados importados.


Colunas:

CO_ANO: ano
CO_MES: mes
CO_NCM: código NCM
CO_UNID: código da unidade estatística
CO_PAIS: código de país de destino/origem do produto
SG_UF_NCM(sigla UF origem/destino da NCM): código da UF de origem/destino do produto
CO_VIA: código da via de transporte
CO_URF(Unidade da Receita Federal): código da URF de embarque/desembarque
QT_ESTAT:  quantidade estatística
KG_LIQUIDO: quilograma líquido
VL_FOB: valor dólar FOB (US$)

Base de dados detalhada por NCM: Arquivos CSV com separador ponto e vírgula (;) detalhado por ano, mês, código NCM, código da unidade estatística, código de país de destino/origem do produto, código da UF de origem/destino do produto, código da via de transporte, código da URF de embarque/desembarque, quantidade estatística, quilograma líquido, valor dólar FOB (US$).

Layout: CO_ANO;CO_MES;CO_NCM;CO_UNID;CO_PAIS;SG_UF_NCM(sigla UF origem/destino da NCM);CO_VIA;CO_URF(Unidade da Receita Federal);QT_ESTAT;KG_LIQUIDO;VL_FOB


## Tabela Importações
    Total de linhas: 33.783.635

## Tabela Exportações
    Total de linhas: 22.648.636