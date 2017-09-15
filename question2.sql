select 
		dept_name,
		count(id) AS Number_of_employee,
		max(basic_salary+hr+da-tax) AS Highest_gross_salary,
		sum(basic_salary+hr+da-tax) AS Total_salary
from
		employee e , department d
where 
		e.dept_id = d.dept_id
group by
		dept_name
