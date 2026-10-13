-- 1 - Quais as 10 categorias de produto com maior receita total?

SELECT
	TOP(10)
	p.product_category_name AS [Nome Categoria Produto], 
	FORMAT(SUM(Oi.price) / 100.0,'C','pt-BR') AS [Receita Total]
FROM
	order_items_olist Oi
INNER JOIN
	products_olist p ON oi.product_id = p.product_id
GROUP BY
	p.product_category_name
ORDER BY
	SUM(Oi.price) DESC