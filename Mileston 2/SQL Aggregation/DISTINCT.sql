-- accounts(id - name - website - lat - long - primary_poc - sales_rep_id)
-- orders(id - account_id - occurred_at - standard_qty - gloss_qty - poster_qty - total - standard_amt_usd -
-- gloss_amt_usd - poster_amt_usd - total_amt_usd)
-- region (id - name)
-- sales_reps (id - name - region_id)
-- web_events (id - account_id - occurred_at - channel)

-- Use DISTINCT to test if there are any accounts associated with more than one region.
-- SOLUTION ::
-- The below two queries have the same number of resulting rows (351), 
-- so we know that every account is associated with only one region. 
-- If each account was associated with more than one region, 
-- the first query should have returned more rows than the second query.
SELECT a.id as "account id", r.id as "region id", 
a.name as "account name", r.name as "region name"
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id;

-- and

SELECT DISTINCT id, name
FROM accounts;

-- Have any sales reps worked on more than one account?
-- SOLUTION
-- Actually all of the sales reps have worked on more than one account. 
-- The fewest number of accounts any sales rep works on is 3. There are 50 sales reps, 
-- and they all have more than one account. 
-- Using DISTINCT in the second query assures that all of the sales reps are accounted for in the first query.

SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
ORDER BY num_accounts;

-- and

SELECT DISTINCT id, name
FROM sales_reps;




















