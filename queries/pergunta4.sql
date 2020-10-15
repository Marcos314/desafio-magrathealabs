  -- Representatividade em valor de exportação por estado no ano de 2019 em relação ao total exportado pelo país no mesmo ano;
SELECT
  uf AS estado,
  ano,
  SUM(VL_FOB) AS total_exportado
FROM
  `visualizacao-de-dados.desafioMagrathea.exportacao`
WHERE
  ano = 2019
  AND uf IN ('SP',
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
GROUP BY
  estado,
  ano
ORDER BY
  total_exportado DESC;