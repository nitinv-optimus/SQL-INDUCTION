
select 
	dept_name,
	number_of_employees
from
(
select 
	dept_name,
	count(id) AS number_of_employees
from 
	employee e,
	department d
where e.dept_id = d.dept_id
group by dept_name
)a
where number_of_employees > 3


select 
	dept_name,
	count(id) AS number_of_employees
from 
	employee e,
	department d
where e.dept_id = d.dept_id
group by dept_name
having count(id) > 3