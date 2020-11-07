-- Each company in the accounts table wants to create an email address for each primary_poc. 
-- The email address should be the first name of the primary_poc . last name primary_poc @ company name .com.
WITH email AS (
	SELECT LEFT(primary_poc, POSITION(' ' IN primary_poc) - 1) AS first_name,
	LEFT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name,
	name AS company_name
	FROM accounts 
	)

SELECT first_name || '.' || last_name || '@' || rtrim(company_name, ' ') || '.com' AS Email
FROM email

---------------- sol 2
WITH t1 AS (
 SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
 FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com')
FROM t1;

-- You may have noticed that in the previous solution some of the company names include spaces,
 -- which will certainly not work in an email address. 
 -- See if you can create an email address that will work by removing all of the spaces in the account name, 
 -- but otherwise your solution should be just as in question 1. Some helpful documentation is here.
 WITH t1 AS (
 SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
 FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', REPLACE(name, ' ', ''), '.com')
FROM  t1;


-- We would also like to create an initial password, which they will change after their first log in. 
-- The first password will be the first letter of the primary_poc's first name (lowercase), 
-- then the last letter of their first name (lowercase), the first letter of their last name (lowercase), 
-- the last letter of their last name (lowercase), the number of letters in their first name, 
-- the number of letters in their last name, and then the name of the company they are working with, 
-- all capitalized with no spaces.
WITH t1 AS (
	SELECT LEFT(primary_poc, POSITION(' ' IN primary_poc) - 1) AS first_name,
	LEFT(primary_poc, LENGTH(primary_poc) - POSITION(' ' IN primary_poc)) AS last_name,
	REPLACE(name, ' ', '') AS company_name
	FROM accounts 
	),

t2 AS (
	SELECT LEFT(LOWER(first_name), 1) one,
	RIGHT(LOWER(first_name), 1) two,
	LEFT(LOWER(last_name), 1) three,
	RIGHT(LOWER(last_name), 1) four,
	LENGTH(first_name) five,
	LENGTH(last_name) six, 
	company_name seven
	FROM t1
		)


SELECT one || two || three || four || five || six || seven
FROM t2

-- SOL 2 
WITH t1 AS (
 SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
 FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com'), LEFT(LOWER(first_name), 1) || RIGHT(LOWER(first_name), 1) || LEFT(LOWER(last_name), 1) || RIGHT(LOWER(last_name), 1) || LENGTH(first_name) || LENGTH(last_name) || REPLACE(UPPER(name), ' ', '')
FROM t1;