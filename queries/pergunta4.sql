-- Representatividade em valor de exportação por estado no ano de 2019 em relação ao total exportado pelo país no mesmo ano;

SELECT sg_uf_ncm as estado, SUM(vl_fob) AS total FROM exportacao
WHERE co_ano = 2019 and sg_uf_ncm IN ('SP', 'SC', 'PR', 'RS', 'MG', 'ES', 'MT', 'CE', 'RJ', 'MS','GO', 'BA', 'RO', 'PA', 'RE', 'RN', 'PB', 'PE', 'TO', 'AL', 'MA', 'AM', 'PI', 'DF', 'SE', 'AP', 'AC')
GROUP BY(estado)
ORDER BY total DESC;