-- -- Window functions provide the ability to perform calculations across sets of rows
-- --  that are related to the current query row

-- these functions must be invoked using window function syntax; that is an OVER clause is required.
-- In addition to these functions, any built-in or user-defined aggregate function can be used as a window function
-- Window functions can be used in the SELECT, ORDER BY, and GROUP BY clauses of a query
-- Window functions can be used to perform calculations across sets of rows that are related to the current query

-- Syntax:

-- SUM(expression) OVER (window_definition)
-- AVG(expression) OVER (window_definition)
-- MIN(expression) OVER (window_definition)
-- MAX(expression) OVER (window_definition)
-- COUNT(expression) OVER (window_definition)
--  Aggregate functions act as window functions only when an OVER clause follows the call; otherwise they act as regular aggregates
-- ROW_NUMBER() OVER (window_definition)

-- Example:

-- Calculate the average age of employees in each department

SELECT department, AVG(age) AS average_age
FROM employees

GROUP BY department
ORDER BY average_age DESC;

-- Example:
-- Calculate the average age of employees in each department using window function
SELECT department, AVG(age) OVER (PARTITION BY department) AS average_age

FROM employees

ORDER BY average_age DESC;

-- Example:


