-- 3 - Quais vendedores tem o maior atraso médio?

SELECT TOP 10
	LEFT(oi.seller_id, 6) AS [Vendedor],
	COUNT(DISTINCT oo.order_id) AS [Pedidos],
	AVG(CAST(DATEDIFF(day, oo.order_estimated_delivery_date, oo.order_delivered_customer_date) AS FLOAT)) AS [Média de Atraso]
FROM
	orders_olist oo
INNER JOIN
	order_items_olist oi ON oo.order_id = oi.order_id
WHERE
	oo.order_status = 'delivered'
	AND oo.order_delivered_customer_date IS NOT NULL
GROUP BY
	oi.seller_id
HAVING
	COUNT(DISTINCT oo.order_id) >= 30
ORDER BY
	[Média de Atraso] DESC
