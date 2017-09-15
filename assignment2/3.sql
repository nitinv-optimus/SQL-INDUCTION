create table t_atten_det(
atten_id int IDENTITY(1001,1),
emp_id int FOREIGN KEY REFERENCES t_emp(emp_id),
activity_id int FOREIGN KEY REFERENCES t_activity(activity_id),
atten_start_datetime smalldatetime,
atten_end_hours int
)

insert into t_atten_det(emp_id,activity_id,atten_start_datetime,atten_end_hours)
values(1001,5,'2011-02-13 10:00:00',2)

select * from t_atten_det


insert into t_atten_det(emp_id,activity_id,atten_start_datetime,atten_end_hours)
values(1001,1,'01/14/2011 10:00:00',3)


insert into t_atten_det(emp_id,activity_id,atten_start_datetime,atten_end_hours)
values(1001,3,'01/14/2011 13:00:00',5),
(1003,5,'02/16/2011 10:00:00',8),
(1003,5,'02/17/2011 10:00:00',8),
(1003,5,'02/19/2011 10:00:00',7)



