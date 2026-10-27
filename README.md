# Análise de E-commerce Brasileiro (Olist) — Projeto SQL

Projeto de portfólio para análise de dados usando **somente SQL**, aplicado ao dataset público da Olist (maior marketplace de e-commerce do Brasil).

## Objetivo

Responder perguntas de negócio reais sobre vendas, logística, pagamentos e satisfação do cliente, usando consultas SQL que vão de agregações simples a window functions.

## Ferramentas

- **SQL Server (SSMS)** para modelagem e consultas
- Dataset: [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (Kaggle)

## Preparação

Ao importar os CSVs no SQL Server, as colunas price, freight_value e payment_value vieram multiplicadas por 100. Rode [`00_preparacao_dados.sql`](./00_preparacao_dados.sql) antes das demais queries.

## Modelo de dados

O dataset é composto por 9 tabelas relacionadas por IDs:

| Tabela | Conteúdo |
|---|---|
| `orders` | Pedidos, com datas de compra, aprovação e entrega |
| `customers` | Clientes e sua localização |
| `order_items` | Itens de cada pedido, com preço e vendedor |
| `products` | Produtos e suas categorias |
| `sellers` | Vendedores e sua localização |
| `order_payments` | Forma e valor de pagamento de cada pedido |
| `order_reviews` | Avaliações dos clientes |
| `geolocation` | Coordenadas por CEP |
| `product_category_name_translation` | Tradução das categorias (PT → EN) |

## Perguntas de negócio

### 1. Quais as 10 categorias com maior receita?
[`01_receita_por_categoria.sql`](./01_receita_por_categoria.sql)

JOIN entre `order_items` e `products`, agregando receita por categoria.

**Insight:** `beleza_saude` e `relogios_presentes` lideram em receita total.

### 2. Qual o tempo médio de entrega por estado do cliente?
[`02_tempo_entrega_por_estado.sql`](./02_tempo_entrega_por_estado.sql)

Cálculo de dias entre compra e entrega (`DATEDIFF`), agrupado por estado.

**Insight:** estados do Norte/Nordeste apresentam tempos de entrega significativamente maiores que o Sudeste.

### 3. Quais vendedores têm o maior atraso médio?
[`03_atraso_medio_por_vendedor.sql`](./03_atraso_medio_por_vendedor.sql)

Diferença entre data estimada e data real de entrega, por vendedor.

**Insight:** há vendedores com atraso médio consistente, candidatos a revisão de SLA.

### 4. Qual a distribuição de métodos de pagamento e o ticket médio?
[`04_metodos_pagamento.sql`](./04_metodos_pagamento.sql)

Contagem e valor médio por tipo de pagamento.

**Insight:** cartão de crédito domina em volume de uso.

### 5. Como a nota de avaliação varia por categoria?
[`05_nota_media_por_categoria.sql`](./05_nota_media_por_categoria.sql)

Nota média de review, conectando reviews → itens → produtos.

**Insight:** categorias com maior receita nem sempre têm as melhores avaliações.

### 6. Qual o crescimento percentual da receita mês a mês?
[`06_ranking_mensal_crescimento.sql`](./06_ranking_mensal_crescimento.sql)

CTE + `LAG()` para comparar receita com o mês anterior.

**Insight:** após o período inicial de operação (até dez/2016), a receita mostra crescimento consistente mês a mês a partir de 2017.

## Conceitos aplicados

`JOIN` · `GROUP BY` · `DATEDIFF` · `CTE (WITH)` · Window Functions (`LAG`) · `CAST` · `ROUND`

## Autor

Rayan — [LinkedIn](https://www.linkedin.com/in/rayansouza) · [GitHub](https://github.com/Rayan-Souza)
