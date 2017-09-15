select 
	name,
	dept_name,
	highest_gross_salary
from
(
select name,
	dept_name,
	sum(basic_salary+hr+da+tax) AS highest_gross_salary,
	RANK() over (partition by dept_name order by sum(basic_salary+hr+da+tax) DESC) RN
from  
	department d
LEFT JOIN employee e ON e.dept_id = d.dept_id
group by dept_name,name
)a
where RN = 1