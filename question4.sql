select 
		id,
		name
from
(
select 
		id,
		name,
		sum(basic_salary+hr+da+tax) AS gross_salary
from employee

group by id,name
)a
where gross_salary > 15000