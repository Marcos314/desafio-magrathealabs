-- Mostre qual os top 3 produtos exportados em cada mês de 2019 por estado;

SELECT * FROM (
SELECT sg_uf_ncm AS estado, co_ncm AS produto, co_mes AS mes, COUNT(co_ncm) as qtd_produtos_importados, RANK() OVER(
PARTITION BY co_mes ORDER BY COUNT(co_ncm) DESC) produto_rank

FROM importacao
WHERE co_ano = 2019 and sg_uf_ncm IN ('SP', 'SC', 'PR', 'RS', 'MG', 'ES', 'MT', 'CE', 'RJ', 'MS',
       'GO', 'BA', 'RO', 'PA', 'RE', 'RN', 'PB', 'PE', 'TO', 'AL', 'MA',
       'AM', 'PI', 'DF', 'SE', 'AP', 'AC')
GROUP BY (estado, produto, mes)
ORDER BY qtd_produtos_importados DESC
) AS t

WHERE produto_rank < 4 