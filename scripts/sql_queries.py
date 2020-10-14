drop_exportacao = "DROP TABLE IF EXISTS exportacao"
drop_importacao = "DROP TABLE IF EXISTS importacao"


create_table_exportacao = """    
    
    CREATE TABLE IF NOT EXISTS exportacao (       
        CO_ANO Integer,
        CO_MES Integer, 
        CO_NCM VARCHAR,
        CO_UNID Integer,
        CO_PAIS VARCHAR,
        SG_UF_NCM VARCHAR(2),
        CO_VIA Integer,
        CO_URF VARCHAR,
        QT_ESTAT BIGINT,
        KG_LIQUIDO BIGINT,
        VL_FOB BIGINT
    )
"""

create_table_importacao = """    
    
    CREATE TABLE IF NOT EXISTS importacao (       
        CO_ANO Integer,
        CO_MES Integer, 
        CO_NCM VARCHAR,
        CO_UNID Integer,
        CO_PAIS VARCHAR,
        SG_UF_NCM VARCHAR(2),
        CO_VIA Integer,
        CO_URF VARCHAR,
        QT_ESTAT BIGINT,
        KG_LIQUIDO BIGINT,
        VL_FOB BIGINT
    )
"""

create_table_queries = [create_table_exportacao, create_table_importacao]
drop_table_queries = [drop_exportacao,drop_importacao]


# Schema BigQuery
# ano:INTEGER,
# mes:INTEGER,
# produto: STRING,
# CO_UNID: Integer,
# CO_PAIS: STRING,
# uf: STRING,
# CO_VIA: Integer,
# CO_URF: STRING,
# QT_ESTAT: STRING,
# KG_LIQUIDO: STRING,
# VL_FOB: STRING