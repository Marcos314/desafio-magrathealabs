-- Contando registros entre 2017 e 2019
--SELECT COUNT (*) FROM importacao WHERE co_ano > 2016 and co_ano < 2020;

-- Mostre qual os top 3 produtos mais importados por estado nos anos de 2017;

-- SELECT sg_uf_ncm AS estado, co_ncm AS produto, COUNT(co_ncm) as qtd_produtos_importados FROM importacao
-- WHERE co_ano = 2017
-- GROUP BY (estado, produto) LIMIT 3
-- ORDER BY qtd_produtos_importados;

SELECT sg_uf_ncm AS estado, co_ncm AS produto, COUNT(co_ncm) as qtd_produtos_importados,
RANK() OVER(PARTITION BY sg_uf_ncm ORDER BY COUNT(co_ncm) DESC)FROM importacao
WHERE co_ano BETWEEN 2017 AND 2019
GROUP BY  (estado , produto)
ORDER BY COUNT(co_ncm) DESC


SELECT * FROM (

    SELECT sg_uf_ncm, co_ncm, DENSE_RANK() OVER(
        PARTITION BY sg_uf_ncm ORDER BY co_ncm DESC
    ) produto_rank
FROM importacao
) t

WHERE produto_rank < 4




-- Funfou

SELECT * FROM (

    SELECT sg_uf_ncm AS estado, co_ncm AS produto, COUNT(co_ncm) as qtd_produtos_importados, RANK() OVER(
        PARTITION BY sg_uf_ncm ORDER BY COUNT(co_ncm) DESC
    ) produto_rank
FROM importacao
WHERE co_ano BETWEEN 2017 and 2019
GROUP BY (estado, produto)
ORDER BY qtd_produtos_importados DESC
) AS t

WHERE produto_rank < 4 