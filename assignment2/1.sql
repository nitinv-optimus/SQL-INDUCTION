create database assignment2

use assignment2


create table t_emp(
emp_id int PRIMARY KEY IDENTITY(1001,2),
emp_code varchar(40),
emp_f_name varchar(40) NOT NULL,
emp_m_name varchar(40),
emp_l_name varchar(40),
emp_DOB date,
emp_DOJ date NOT NULL,
CONSTRAINT age check (DATEDIFF(year, emp_DOJ , emp_DOB) < 18)
)




insert into t_emp(emp_code,emp_f_name,emp_l_name,emp_DOB,emp_DOJ)
values('OPT20110105','Manmohan','Singh','1983-02-10','2010-05-25')

insert into t_emp(emp_code,emp_f_name,emp_m_name,emp_l_name,emp_DOB,emp_DOJ)
values('OPT20100915','Alfred','joseph','lawrence','1988-02-28','2017-10-24')

select * from t_emp
