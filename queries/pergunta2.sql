  -- Mostre qual os top 3 produtos mais importados por estado entre 2017 e 2019
SELECT
  *
FROM (
  SELECT
    uf AS estado,
    produto,
    ano,
    COUNT(produto) AS qtd_produtos_importados,
    RANK() OVER(PARTITION BY uf, ano ORDER BY COUNT(produto) DESC) produto_rank
  FROM
    `visualizacao-de-dados.desafioMagrathea.importacao`
  WHERE
    ano BETWEEN 2017
    AND 2019
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
    produto,
    estado,
    ano
  ORDER BY
    qtd_produtos_importados DESC ) AS t
WHERE
  produto_rank < 4