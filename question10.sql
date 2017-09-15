select
	name
from
(
select
	name,
	sum(present_day) AS present,
	sum(working_days) AS total
from 
	employee e,
	employee_attendance a
where e.id = a.emp_id
group by name
)a
where
	total - present > 3