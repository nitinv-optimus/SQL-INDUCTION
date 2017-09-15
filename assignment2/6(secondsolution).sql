select ISNULL(te.emp_f_name,'')+' '+ISNULL(te.emp_m_name,'')+' '+ISNULL(te.emp_l_name,'') full_name,
       LJ2.got_increment,
	   LJ2.prev_sal,
	   LJ2.new_sal,
	   LJ1.total_worked_hours,
	   LJ3.activity_description,
	   LJ3.atten_end_hours
from
t_emp te
left join 
(
	select emp_id,sum(atten_end_hours) total_worked_hours
	from dbo.t_atten_det
	group by emp_id
) LJ1 on te.emp_id = LJ1.emp_id
left join
(
			select a.emp_id,
			   a.new_salary new_sal, 
			   b.new_salary prev_sal,
			   case when (a.new_salary-b.new_salary)<=0 then 'no'
							when (a.new_salary-b.new_salary)>0 then 'yes' end got_increment
		from
		( 
				select emp_id, new_salary, 
				ROW_NUMBER() OVER (partition by emp_id ORDER BY changed_date desc) rn
				from t_salary
		) a 
		left join 
		( 
				select emp_id ,new_salary, 
				ROW_NUMBER() OVER (partition by emp_id ORDER BY changed_date) rn
				from t_salary
		) b on a.emp_id = b.emp_id
		where a.rn = 1 and b.rn = 1
) LJ2 on LJ1.emp_id = LJ2.emp_id
left join
(
	select emp_id, atten_end_hours, t_activity.activity_description 
	from t_atten_det td
	left join t_activity on t_activity.activity_id = td.activity_id
	where atten_start_datetime = (select max(atten_start_datetime) from t_atten_det tad where td.emp_id= tad.emp_id group by tad.emp_id) 
) LJ3 on LJ3.emp_id =LJ1.emp_id