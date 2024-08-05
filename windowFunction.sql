-- A window function performs a calculation across a set of table rows 
-- that are somehow related to the current row. This is comparable to the 
-- type of calculation that can be done with an aggregate function. 
-- But unlike regular aggregate functions, use of a window function does 
-- not cause rows to become grouped into a single output row — the rows retain 
-- their separate identities. Behind the scenes, the window function is able to 
-- access more than just the current row of the query result.

SELECT depname, empno, salary, avg(salary) OVER (PARTITION BY depname) FROM empsalary;

 depname  | empno | salary |          avg          
-----------+-------+--------+-----------------------
 develop   |    11 |   5200 | 5020.0000000000000000
 develop   |     7 |   4200 | 5020.0000000000000000
 develop   |     9 |   4500 | 5020.0000000000000000
 develop   |     8 |   6000 | 5020.0000000000000000
 develop   |    10 |   5200 | 5020.0000000000000000
 personnel |     5 |   3500 | 3700.0000000000000000
 personnel |     2 |   3900 | 3700.0000000000000000
 sales     |     3 |   4800 | 4866.6666666666666667
 sales     |     1 |   5000 | 4866.6666666666666667
 sales     |     4 |   4800 | 4866.6666666666666667