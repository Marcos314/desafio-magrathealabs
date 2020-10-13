-- Exportacao 2017

SELECT * FROM (

    SELECT co_ano AS ano, sg_uf_ncm AS estado, co_ncm AS produto, COUNT(co_ncm) as qtd_produtos_exportados, RANK() OVER(
        PARTITION BY sg_uf_ncm ORDER BY COUNT(co_ncm) DESC
    ) produto_rank
FROM exportacao
[[WHERE co_ano = {{co_ano}}]]
GROUP BY (produto, estado,ano )
ORDER BY qtd_produtos_exportados DESC 
) AS t

WHERE produto_rank < 4 
