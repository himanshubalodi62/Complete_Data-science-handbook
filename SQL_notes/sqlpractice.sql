Create database interview;
show databases;
use interview;

Create table employee1(
             empID int not null,
             empName varchar(50),
             Gender char,
             Salary int,
             City char(20));
             
select * from employee1;

insert into employee1 
values(1,"Arjun","M",75000,"Pune"),
	  (2,"Ekadanta","M",125000,"Banglore"),
      (3,"Lalita","F",150000,"Mathura"),
      (4,"Madhav","M",250000,"Delhi"),
      (5,"Visakha","F",120000,"Mathura")
      
      

select * from employee1;




CREATE TABLE EmployeeDetail1 (
EmpID int NOT NULL,
Project Varchar(50),
EmpPosition Char(20),
DOJ date )

select * from EmployeeDetail1;

INSERT INTO EmployeeDetail1
VALUES (1, 'P1', 'Executive', '26-01-2019'),
       (2, 'P2', 'Executive', '04-05-2020'),
       (3, 'P1', 'Lead', '21-10-2021'),
       (4, 'P3', 'Manager', '29-11-2019'),
       (5, 'P2', 'Manager', '01-08-2020')
                            
select empName , Salary 

select empName , City
from employee1 
where Salary between 200000 and 300000;

select empName , Salary
from employee1
where Salary > 200000 and Salary < 300000;

#Write a query to retrieve the list of employees from the same city.
select e1.empName , e2.City 
from employee1 e1 , employee1 e2
where e1.City = e2.City;

SELECT E1.empID, E1.empName, E1.City
FROM employee1 E1, employee1 E2
WHERE E1.City = E2.City AND E1.empID != E2.empID

### Query to find the null values in the Employee table.

select * from employee1
where empID is null;

#Query to find the cumulative sum of employee’s salary.
SELECT empID, Salary, SUM(Salary) OVER (ORDER BY EmpID) AS CumulativeSum
FROM employee1
select empID , empName , Salary , sum(Salary) over (order by empID) as cumlativesum from employee1; 
#What’s the male and female employees ratio.

SELECT(COUNT(*) FILTER (WHERE Gender = 'M') * 100.0 / COUNT(*)),
(COUNT(*) FILTER (WHERE Gender = 'F') * 100.0 / COUNT(*)) AS FemalePct
FROM employee1;

select
(count(*) filter (where Gender = 'M') * 100.0 / count(*)),
(count(*) filter (where Gender = 'F') * 100.0 / count(*)),
from employee1;

#Write a query to fetch 50% records from the Employee table.

select * from employee1 
where empID <= (select count(empID)/2 from employee1);

#Query to fetch the employee’s salary but replace the LAST 2 digits with ‘XX’
#i.e 12345 will be 123XX

select Salary,
concat(substring(Salary::text, 1, length(Salary::text)-2),'xx') as masked_number from employee1;

SELECT Salary,
CONCAT(SUBSTRING(Salary::text, 1, LENGTH(Salary::text)-2), 'XX') as masked_number
FROM employee1

SELECT Salary, CONCAT(LEFT(CAST(Salary AS text), LENGTH(CAST(Salary AS text))-2), 'XX')
AS masked_number
FROM employee1;

SELECT Salary,
CONCAT(LEFT(Salary, LEN(Salary)-2), 'XX') as masked_salary
FROM employee1;

#Write a query to fetch even and odd rows from Employee table.

SELECT * FROM

(SELECT *, ROW_NUMBER() OVER(ORDER BY empID) AS
RowNumber
FROM employee1) AS Emp
WHERE emp.RowNumber % 2 = 0;

SELECT * FROM employee1
WHERE MOD(empID,2)=0;

SELECT * FROM employee1 
WHERE MOD(empID,2)=1;

SELECT * FROM employee1
WHERE MOD(empID,2)=1;

#Write a query to find all the Employee names whose name:
• #Begin with ‘A’
• #Contains ‘A’ alphabet at second place
• #Contains ‘Y’ alphabet at second last place
• #Ends with ‘L’ and contains 4 alphabets
• #Begins with ‘V’ and ends with ‘A’

select * from employee1 where empName like "A%";
select * from employee1 where empName like "M%";
Select * from employee1 where City like "D%";
Select * from employee1 where City like "M%";

select * from employee1 where empName like "_a%";

select * from employee1 where empName like "%y_";

select * from employee1 where empName like "____l";

select * from employee1 where empName like "V%a";


