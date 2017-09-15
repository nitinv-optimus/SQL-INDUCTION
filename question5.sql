select 
	TOP(1)
	a.basic_salary,
	name,
	id
from
(
select DISTINCT TOP(2) basic_salary
	from employee	
	order by basic_salary DESC
)a
LEFT JOIN employee e ON a.basic_salary=e.basic_salary
order by basic_salary