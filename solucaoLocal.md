# Desafio Magrathea Labs - Engenharia de dados

O estudo abaixo visa analisar os dados públicos disponibilizados pelo governo referentes ao volume de importações e exportações do país.

O desafio consiste em duas partes: 

1. Carregamento e armazenamento dos dados
2. Construção de visualizações dos dados carregados.


### Stack Tecnológica:

- PostgresSQL: https://www.postgresql.org/
- Docker: https://www.docker.com/
- Metabase: https://www.metabase.com/
- Linguagens de programação: Shell Script e Python.
- 

### Execução do projeto

- **Extração dos dados**
    
        $ ./download_dados.sh

- **Carregamento no banco de dados**
    
    Esse script shell ira executar os arquivos create_table.py e insert_data.py respectivamente. 

        $ ./elt.sh



    $  docker pull metabase/metabase


- **Visualização**

    O dashboard foi criado usando a ferramenta metabase, para o uso da mesma foi necessário obter a sua imagem docker.

        $ docker pull metabase/metabase
    
    Para a execução da imagem utilizou-se o seguinte comando:

        $ docker run -d -p 3000:3000 --net=host --name metabase metabase/metabase


    A flag " *--net=host* " foi utilizada para que o metabase pudesse acessar o postgres localmente. 