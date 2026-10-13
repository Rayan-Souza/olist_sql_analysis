-- 6 - Ranking mensal de receita com crescimento em %

WITH Receita
	AS (
SELECT 
	FORMAT(oo.order_purchase_timestamp,'yyyy-MM') AS 'Data_Compra',
	SUM(oi.price) AS 'Receita'
FROM
	order_items_olist oi
INNER JOIN
	orders_olist oo ON  oi.order_id = oo.order_id
GROUP BY
	FORMAT(oo.order_purchase_timestamp,'yyyy-MM')
	)
SELECT	
	Data_compra ,
	Receita,
	LAG(Receita) OVER (ORDER BY Data_compra) AS 'Receita_Mes_Anterior',
	ROUND((Receita - LAG(Receita) OVER (ORDER BY Data_compra)) * 100.0 / LAG(Receita) OVER (ORDER BY Data_compra),2) AS '% Crescimento' 
From Receita
WHERE Data_Compra >= '2017-01'