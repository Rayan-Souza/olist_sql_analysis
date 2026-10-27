-- 00_preparacao_dados.sql
-- Os CSVs do Olist foram importados com valores monetários 100x maiores.
-- Este script converte as colunas para DECIMAL e corrige a escala.
-- Pode ser executado mais de uma vez: só age se a coluna ainda for FLOAT.

IF EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'order_items_olist'
      AND COLUMN_NAME = 'price'
      AND DATA_TYPE = 'float'
)
BEGIN
    ALTER TABLE order_items_olist ALTER COLUMN price DECIMAL(10,2);
    ALTER TABLE order_items_olist ALTER COLUMN freight_value DECIMAL(10,2);
    UPDATE order_items_olist
    SET price = price / 100,
        freight_value = freight_value / 100;
END;

IF EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'order_payments_olist'
      AND COLUMN_NAME = 'payment_value'
      AND DATA_TYPE = 'float'
)
BEGIN
    ALTER TABLE order_payments_olist ALTER COLUMN payment_value DECIMAL(10,2);
    UPDATE order_payments_olist
    SET payment_value = payment_value / 100;
END;