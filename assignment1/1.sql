create database assignment1;

use assignment1;

create table t_product_master(
product_id varchar(40) PRIMARY KEY,
product_name varchar(40),
cost_per_item int);


insert into t_product_master
values('p1','pen',10),
('p2','scale',15),
('p3','notebook',25);


create table t_user_master(
user_id varchar(40) PRIMARY KEY,
user_name varchar(40))


insert into t_user_master
values('u1','Alfred Lawrence'),
('u2','William Paul'),
('u3','Edward phillip')



create table t_transaction(
user_id varchar(40) FOREIGN KEY References t_user_master(user_id),
product_id varchar(40) FOREIGN KEY References t_product_master(product_id),
transaction_date date,
transaction_type varchar(40),
transaction_amount int
)


insert into t_transaction
values('u1','p1','2010-10-25','order',150),
('u1','p1','2010-11-20','payment',750),
('u1','p1','2010-11-20','order',200),
('u1','p3','2010-11-25','order',50),
('u3','p2','2010-11-26','order',100),
('u2','p1','2010-12-15','order',75),
('u3','p2','2011-01-15','payment',250)
