-- 5 - Como a nota média de review varia por categoria de produto?

SELECT	
	po.product_category_name AS 'Categoria_Produto',
	AVG(oo.review_score) AS 'Nota_Média'
FROM
	order_reviews_olist oo
INNER JOIN
	order_items_olist oi ON oo.order_id = oi.order_id
INNER JOIN
	products_olist po ON oi.product_id = po.product_id
GROUP BY
	po.product_category_name
ORDER BY
	Nota_Média DESC