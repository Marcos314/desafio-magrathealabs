
-- Mostre qual os top 3 produtos mais exportados por estado entre 2017 e 2019

SELECT * FROM (

SELECT sg_uf_ncm AS estado, co_ncm AS produto, COUNT(co_ncm) as qtd_produtos_exportados, RANK() OVER(
PARTITION BY sg_uf_ncm ORDER BY COUNT(co_ncm) DESC) produto_rank
FROM exportacao
WHERE co_ano BETWEEN 2017 and 2019 and sg_uf_ncm IN ('SP', 'SC', 'PR', 'RS',
'MG', 'ES', 'MT', 'CE', 'RJ', 'MS', 'GO', 'BA', 'RO', 'PA', 'RE', 'RN', 'PB',
'PE', 'TO', 'AL', 'MA', 'AM', 'PI', 'DF', 'SE', 'AP', 'AC')
GROUP BY (estado, produto)
ORDER BY qtd_produtos_exportados DESC
) AS t

WHERE produto_rank < 4 

