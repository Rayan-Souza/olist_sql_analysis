-- 4 - Qual a distribuição de métodos de pagamento e o ticket médio de cada um?

SELECT
	payment_type,
	COUNT(*) AS 'Quantidade',
	FORMAT(AVG(payment_value) / 100.0,'C','pt-BR') AS 'Ticket_médio'
FROM
	order_payments_olist
GROUP BY
	payment_type
ORDER BY
	Quantidade DESC
