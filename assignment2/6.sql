select emp_id,
emp_f_name,
currentsalary,
total_worked,
previous_salary,
last_worked_activity,
total, 
	   CASE WHEN (previous_salary - currentsalary) < 0
			THEN 'YES' ELSE 'NO' END AS Increment
from
( 
select z.emp_id,
emp_f_name,
currentsalary,
total_worked,
max(s.new_salary) AS previous_salary,
last_worked_activity,
total
from
(
select a.emp_id,
emp_f_name,
s.new_salary AS currentsalary,
sum(atten_end_hours) AS total_worked,
sum(case 
	when t.activity_id = activityid AND t.emp_id=a.emp_id 
	THEN atten_end_hours 
	else 0 END) AS total,
c.activity_description AS last_worked_activity
from
(
select e.emp_f_name,
s.emp_id,
max(t.activity_id) AS activityid
from t_atten_det t  
INNER JOIN t_emp e ON e.emp_id = t.emp_id 
INNER JOIN t_salary s ON s.emp_id = t.emp_id 
group by e.emp_f_name,s.emp_id
) a
INNER JOIN t_atten_det t ON a.emp_id = t.emp_id 
INNER JOIN t_activity c ON c.activity_id = a.activityid 
INNER JOIN t_salary s ON s.emp_id = a.emp_id
where changed_date IN 
(
select max(changed_date)
from t_salary s,t_atten_det t 
where s.emp_id = t.emp_id
group by s.emp_id
)
group by 
c.activity_description,
emp_f_name,new_salary,a.emp_id
)z
INNER JOIN t_salary s ON s.emp_id = z.emp_id
where changed_date IN 
(
select min(changed_date)
from t_salary s,t_atten_det t 
where s.emp_id = t.emp_id
group by s.emp_id
)
group by last_worked_activity,
total,
z.emp_id,
currentsalary,
total_worked,
emp_f_name
) h


