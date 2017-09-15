select 
	dept_name , 
	gender, 
	count(id) Number_of_employees 
from employee e , 
	department d 
where e.dept_id = d.dept_id 
group by gender,dept_name 