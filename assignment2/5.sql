select emp_f_name , 
emp_m_name , 
emp_l_name , 
emp_DOB
from t_emp where emp_DOB = EOMONTH(emp_DOB)

update t_emp
set emp_DOB = '1988-02-29'
where emp_f_name = 'Alfred'



select * from t_emp
