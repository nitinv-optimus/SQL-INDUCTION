select
	name
from
(
select
	name,id,
	sum(present_day) AS present,
	sum(working_days) AS total
from 
	employee e,
	employee_attendance a
where e.id = a.emp_id
group by name,id
)a
where
present = total