-- Mostre qual os top 3 produtos exportados em cada mês de 2019 por estado;

-- Um problema encontrado é o fato da query somar a quantidade de produtos em um mesmo ranque caso essa quantidade for igual.

SELECT
  *
FROM (
  SELECT
    uf AS estado,
    produto,
    mes,
    COUNT(produto) AS qtd_produtos_importados,
    RANK() OVER(PARTITION BY mes, uf ORDER BY COUNT(produto) DESC) produto_rank
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
    produto,
    mes
  ORDER BY
    qtd_produtos_importados DESC ) AS t
WHERE
  produto_rank < 4