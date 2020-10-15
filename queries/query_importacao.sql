-- Enviando ao cloud storage

SELECT
  *
FROM
  importacao
WHERE
  co_ano BETWEEN 2017
  AND 2019
  AND sg_uf_ncm IN ('SP',
    'SC',
    'PR',
    'RS',
    'MG',
    'ES',
    'MT',
    'CE',
    'RJ',
    'MS',
    'GO',
    'BA',
    'RO',
    'PA',
    'RE',
    'RN',
    'PB',
    'PE',
    'TO',
    'AL',
    'MA',
    'AM',
    'PI',
    'DF',
    'SE',
    'AP',
    'AC')