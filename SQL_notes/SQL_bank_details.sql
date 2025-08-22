create database ineuron;
use ineuron;
create table if not exists bank_details1(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int,
housing varchar(30),
loan varchar(30),
contact varchar(30),
`day` int,
`month` varchar(30),
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30))
show tables
Describe bank_details1
insert into bank_details1 values 
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(57,"services","married","secondary","no",162,"yes","no","unknown",5,"may",174,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no")

select * from bank_details1
select age,job from bank_details1
select `default` ,age from bank_details1
select `day` , duration from bank_details1
select * from  bank_details1 where age = 41
select * from bank_details1 where duration = 219
select * from bank_details1 where balance  = 60
select job from bank_details1 where age = 41
select job from bank_details1 where age = 42
select * from bank_details1 where job = 'retired' and balance < 100
select * from bank_details1 where job = 'retired' and balance > 100
select * from bank_details1 where education = 'primary' and balance < 100
select distinct job from bank_details1
select * from bank_details1 order by age 
select * from bank_details1 order by age desc
select count(*) from bank_details1
select sum(balance) from bank_details1
select avg(balance) from bank_details1
select sum(age) from bank_details1
select avg(age) from bank_details1
select sum(duration) from bank_details1
select avg(duration) from bank_details1
select sum(campaign) from bank_details1
select avg(campaign) from bank_details1
select min(balance) from bank_details1
select * from bank_details1 where balance = (select min(balance) from bank_details1)
select count(*) from bank_details1 group by marital
select marital , count(*) from bank_details1 group by marital
select marital , count(*) ,sum(balance),avg(balance) ,sum(age) ,avg(age) from bank_details1 group by marital having sum(balance) > 100
select marital , count(*) ,sum(balance),avg(balance) from bank_details1 group by marital having sum(balance) > 300
set sql_safe_updates = 0
update bank_details1 set balance = 0 where job = 'unknown' 
update bank_details1 set contact = 'known' , y ='yes' where month = 'may'
update bank_details1 set `default` = 'Null' where `default`= 'no' 
update bank_details1 set `day` = 30 where `day` = 5 
delete from bank_details1 where job = 'unknown'
delete from bank_details1 where balance = 2

DELIMITER &&
create procedure select_pre()
BEGIN
     select * from bank_details1;
END &&

call select_pre()

DELIMITER &&
create procedure select_pre_filter()
BEGIN
     select * from bank_details1 where job = 'retired' and balance > 100;
END &&

call select_pre_filter()

DELIMITER &&
create procedure select_pre_filter2(IN var int)
BEGIN
     select * from bank_details1 where job = 'retired' and balance > var;
END &&
call select_pre_filter2(200)

DELIMITER &&
create procedure select_pre_filter4(IN var int)
BEGIN
     select * from bank_details1 order by age = var; 
END &&
call select_pre_filter4(60)

DELIMITER &&
create procedure select_pre_filter6(IN var int ,IN var1 varchar(30))
BEGIN
     select * from bank_details1 where job = var1 and balance > var;
END &&

call select_pre_filter6(100,'services')
call select_pre_filter2(200)
call select_pre_filter()
call select_pre()

select  job , age , education , y from bank_details1 

select  marital ,`default` ,contact from bank_details1

(select  job , age , education , y from bank_details1) as a * from a where a.age = 58 

select * from (select  job , age , education , y from bank_details1) as a where a.age = 58

select  job , age , education , y from bank_details1 where age = 58

create view bank_view as select job , age , education , y from bank_details1

select  * from bank_view where age = 58

create table if not exists bank_details3(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int,
housing varchar(30),
loan varchar(30),
contact varchar(30),
`day` int,
`month` varchar(30),
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30))

show tables
insert into bank_details3 select * from bank_details1 where age = 58;
select * from bank_details3

select bank_details1.age , bank_details1.job , bank_details1.marital from bank_details1 inner join bank_details3 on bank_details1.age =bank_details3.age
select bank_details1.age , bank_details1.job , bank_details1.marital from bank_details1 right join  bank_details3 on bank_details1.age =bank_details3.age
select bank_details1.age , bank_details1.job , bank_details1.marital from bank_details1 left join bank_details3 on bank_details1.age =bank_details3.age