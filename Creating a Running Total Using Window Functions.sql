-- Using Derek's previous video as an example, create another running total. 
-- This time, create a running total of standard_amt_usd (in the orders table)
--  over order time with no date truncation. Your final table should have two columns: 
--  one with the amount being added for each new row, and a second with the running total.

SELECT standard_amt_usd, SUM(standard_amt_usd) OVER (ORDER BY occurred_at)
FROM orders;

-- Now, modify your query from the previous quiz to include partitions. 
-- Still create a running total of standard_amt_usd (in the orders table) 
-- over order time, but this time, date truncate occurred_at by year and 
-- partition by that same year-truncated occurred_at variable. Your final 
-- table should have three columns: One with the amount being added for each row, 
-- one for the truncated date, and a final column with the running total within each year

SELECT standard_amt_usd,
       DATE_TRUNC('year', occurred_at) as year,
       SUM(standard_amt_usd) OVER (PARTITION BY DATE_TRUNC('year', occurred_at) ORDER BY occurred_at) AS running_total
FROM orders

-- Select the id, account_id, and total variable from the orders table, then create a 
-- column called total_rank that ranks this total amount of paper ordered (from highest to lowest)
--  for each account using a partition. Your final table should have these four columns

SELECT id,
       account_id,
       total,
       RANK() OVER (PARTITION BY account_id ORDER BY total DESC) AS total_rank
FROM orders