SELECT * FROM(
SELECT e.*, 
row_number() OVER (PARTITION BY dept_name ORDER BY emp_id ASC) as rn
	From employee e ) sub

WHERE sub.rn <3;

-- Fetch the top 3 employees in each department earning the max salary.
SELECT * FROM (
SELECT e.*,
	rank() OVER (PARTITION BY dept_name ORDER BY salary DESC ) as rank
	FROM employee e) sub 
WHERE sub.rank < 4;
select * from ( 
	select e.*,
	rank() over(partition by dept_name order by salary desc) as rnk,
	dense_rank() over(partition by dept_name order by salary desc) as dense_rnk,
	row_number() over(partition by dept_name order by salary desc) as rn
	from employee e) x


where x.rnk < 4;

-- lead and lag

-- fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee.
SELECT e.*,
	lag(salary) over (partition by dept_name order by emp_id) as prev_empl_sal,
	CASE WHEN e.salary > lag(salary) over (partition by dept_name order by emp_id) THEN 'Higher than previous employee'
			WHEN e.salary < lag(salary) over (partition by dept_name order by emp_id) THEN 'Lower than previous employee'
			WHEN e.salary = lag(salary) over (partition by dept_name order by emp_id) THEN 'equal to previous employee'
	END as salary_range
from employee e;
