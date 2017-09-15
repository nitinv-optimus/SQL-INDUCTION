select 
	dept_name,
	name
from 
	employee e, 
	department d
where e.id = d.dept_head_id