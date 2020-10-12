# Desafio Magrathea Labs - Engenharia de dados

O estudo abaixo visa analisar os dados públicos disponibilizados pelo governo referentes ao volume de importações e exportações do país.

O desafio consiste em duas partes: 

1. Carregamento e armazenamento dos dados
2. Construção de visualizações dos dados carregados.



Links importantes:
- [Informações sobre layout de dados](http://www.mdic.gov.br/index.php/comercio-exterior/estatisticas-de-comercio-exterior/base-de-dados-do-comercio-exterior-brasileiro-arquivos-para-download
)
- [Dados de Exportações](http://www.mdic.gov.br/balanca/bd/comexstat-bd/ncm/EXP_COMPLETA.zip)
- [Dados de Importações](http://www.mdic.gov.br/balanca/bd/comexstat-bd/ncm/IMP_COMPLETA.zip)

Layout: CO_ANO;CO_MES;CO_NCM;CO_UNID;CO_PAIS;SG_UF_NCM(sigla UF origem/destino da NCM);CO_VIA;CO_URF(Unidade da Receita Federal);QT_ESTAT;KG_LIQUIDO;VL_FO

### Stack Tecnológica:

- Airflow: https://airflow.apache.org/
- PostgresSQL:
- Docker:
- GeoPandas:
- Metabase/Datapane:
- Linguagens de programação: Shell Script e Python.
### Decisões arquiteturais:
O Airflow foi escolhido para orquestrar a pipeline de dados por ser flexível e permitir organizar os passos com facilidades. Também devido ao requisito relacionado ao download e carregamento automatizado dos dados em um banco para análise de forma periódica e a criação de uma rotina de verificação de qualidade dos dados importados.


### Modelagem dos dados

### Execução do projeto

    # Instalação
    $ sudo docker pull puckel/docker-airflow

    # Repositório com os demais executores (Postgres)
    $ git clone https://github.com/puckel/docker-airflow.git

    # Iniciando os demais executores
    docker-compose -f docker-compose-LocalExecutor.yml up -d


### Criação das DAGs
