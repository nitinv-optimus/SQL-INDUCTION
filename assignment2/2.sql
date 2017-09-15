create table t_activity(
activity_id int PRIMARY KEY IDENTITY(1,1),
activity_description varchar(40)
)


insert into t_activity(activity_description)
values('Code Analysis'),('Lunch'),('Coding'),('knowledge transition'),('Database')

select * from t_activity
