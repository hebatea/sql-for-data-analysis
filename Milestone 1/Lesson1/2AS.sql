SELECT ( standard_amt_usd / standard_qty ) AS unit_price, id, account_id
FROM orders
LIMIT 10;

SELECT ( poster_amt_usd / (standard_amt_us + gloss_amt_usd + poster_amt_usd) ) * 100 AS pre_revenue, id, account_id
FROM orders
LIMIT 10;