-- 2 - Qual o tempo médio de entrega por Estado do cliente?

SELECT
	c.customer_state AS 'Estado_Cliente',
	AVG(DATEDIFF(DAY , oo.order_purchase_timestamp, oo.order_delivered_customer_date)) AS Dias_para_entrega
FROM
	orders_olist oo
INNER JOIN
	Custumers_olist c ON c.customer_id = oo.customer_id
GROUP BY
	c.customer_state
ORDER BY
	Dias_para_entrega DESC
