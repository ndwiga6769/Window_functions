-- Typically, the use case for leveraging the UNION command in SQL is when
-- a user wants to pull together distinct values of specified columns that 
-- are spread across multiple tables. For example, a chef wants to pull together
-- the ingredients and respective aisle across three separate meals that are 
-- maintained in different tables.

-- Details of UNION
-- There must be the same number of expressions in both SELECT statements.
-- The corresponding expressions must have the same data type in the SELECT
-- statements. For example: expression1 must be the same data type in both the
--  first and second SELECT statement.

SELECT expression1, expression2, ... expression_n
FROM tables
[WHERE conditions]
UNION
SELECT expression1, expression2, ... expression_n
FROM tables
[WHERE conditions];