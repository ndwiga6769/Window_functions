-- Purpose
-- It returns the value from a previous row to the current row in the table.
-- Step 1:
-- Let’s first look at the inner query and see what this creates.

SELECT 	account_id, SUM(standard_qty) AS standard_sum
FROM       orders
GROUP BY   1

-- The query sums the standard_qty amounts for each account_id to give the standard paper each account has purchased over all time.
-- Notice that the results are not ordered by account_id or standard_qty.


-- Step 2:
-- Now, let's look at the outer query and see what it does.

SELECT     account_id,standard_sum
FROM
(
    SELECT 	account_id, SUM(standard_qty) AS standard_sum
FROM       orders
GROUP BY   1
) sub

-- Step 3 (Part A):
-- We add the Window Function OVER (ORDER BY standard_sum) in the outer query that will
--  create a result set in ascending order based on the standard_sum column.
SELECT     account_id,
            standard_sum,
            LAG(standard_sum) OVER (ORDER by standard_sum) as lag
FROM
(
    SELECT 	account_id, SUM(standard_qty) AS standard_sum
FROM       orders
GROUP BY   1
) sub 


-- Step 3 (Part B):
-- The LAG function creates a new column called lag as part of the outer query:
--  LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag. This new column named 
--  lag uses the values from the ordered standard_sum (Part A within Step 3).

SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag
FROM   (
        SELECT   account_id,
                 SUM(standard_qty) AS standard_sum
        FROM     demo.orders
        GROUP BY 1
       ) sub

-- Step 3 (Part B):
-- The LAG function creates a new column called lag as part of the outer query:
-- LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag. This new column named
-- lag uses the values from the ordered standard_sum (Part A within Step 3).

SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag
FROM   (
        SELECT   account_id,
                 SUM(standard_qty) AS standard_sum
        FROM     demo.orders
        GROUP BY 1
       ) sub

-- To compare the values between the rows, we need to use both columns (standard_sum and lag). 
-- We add a new column named lag_difference, which subtracts the lag value from the value in 
-- standard_sum for each row in the table:

SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER (order by standard_sum) as lag,
       standard_sum - LAG(standard_sum) OVER (order by standard_sum) as lag_difference
       FROM   (
        SELECT   account_id,
                 SUM(standard_qty) AS standard_sum
        FROM     demo.orders
        GROUP BY 1
       ) sub