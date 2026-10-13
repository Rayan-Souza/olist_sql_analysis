-- 3 - Quais vendedores tem o maior atraso médio?

SELECT	
	oi.seller_id AS [ID do Vendedor],
	AVG(DATEDIFF(day, oo.order_estimated_delivery_date, oo.order_delivered_customer_date)) AS [Média de Atraso]
FROM
	orders_olist oo
INNER JOIN
	order_items_olist oi ON oo.order_id = oi.order_id
WHERE
	oo.order_delivered_customer_date IS NOT NULL
GROUP BY
	oi.seller_id
ORDER BY
	[Média de Atraso] DESC
