Create database testdb;
show databases;
use testdb;
create table customer
( 
  ID int8 primary key,
  Name varchar(50) not null,
  Age int not null,
  City char(50),
  Salary numeric
 );
 
 select * from customer;
 
 insert into customer values
 (1,"Sam",26,"Delhi",9000),
 (2,"Tan",19,"Banglore",1100),
 (3,"Pam",31,"Mumbai",6000),
 (4,"Jan",42,"Pune",10000);
 
 
 update customer set name = "xam" , age = 32 where ID = 4;
 
 update customer set City = "ranchi" , age = 44 where ID = 2;
 
 truncate table customer;
 
 select * from customer;
 
 create table office
 (
 customer_id int8 primary key,
 first_name varchar(50),
 last_name varchar(50),
 email varchar(100),
 address_id int8
 )
 
 select * from office;
 
 Copy office(customer_id,first_name,last_name,email,address_id)
 from 'C:\Users\Balodi\Downloads\customer.csv'
 delimiter ',' csv header;
 
 create table payment
 (
 customer_id int8 primary key,
 amount int8 not null,
 mode varchar(50),
 payment_date date
 )
 
 select * from payment;
 
 select upper(first_name) from office;
 select lower(first_name) from office;
 select length(first_name) , first_name from office;
 select substring(first_name,2,4), first_name from office;
 select replace(first_name,"Mary","Mohali"),first_name,last_name from office;
 
 select count(*) from payment;
 select round(avg(amount),2) from payment;
 
 select mode ,sum(amount) as total from payment group by mode;
 
 select mode , sum(amount) as total from payment group by mode  order by total asc;
 
 select mode , sum(amount) as total from payment group by mode order by total desc;
 
 select * from payment;
 
 
 show timezone
 select now() 
 select timeday()
 select current_time
 select current_date
 
 select extract(year from payment_date) as pay_year,payment_date from payment;
 
 select extract(DOW from payment_date) as pay_DOW , payment_date from payment;
 
 select * from office;
 
 select * from office as o inner join payment as p on o.customer_id = p.customer_id;
 
 select * from payment where amount > (select avg(amount) from payment)
 
 select customer_id, amount, mode from payment where customer_id in (select customer_id from office);