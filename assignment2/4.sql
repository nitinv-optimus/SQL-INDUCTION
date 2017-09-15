create table t_salary(
salary_id int PRIMARY KEY IDENTITY(1001,1),
emp_id int FOREIGN KEY REFERENCES t_emp(emp_id),
changed_date date,
new_salary int
)

insert into t_salary (emp_id,changed_date,new_salary)
values(1003,'02-16-2011',20000),
(1003,'01-05-2011',25000),
(1001,'02-16-2011',26000)