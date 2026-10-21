create database orginization;
use orginization;

create table employee(
empid int not null primary key,
first_name varchar(15),
last_name varchar(15),
gender char,
role varchar(20),
dept varchar(12),
manager_id varchar(10));

desc employee;

insert into employee values(1, 'manali', 'Barge', 'F', 'Team leader', 'Retail', 'M11');
insert into employee values(2, 'Gouri', 'Shinde', 'F', 'Team leader', 'Finance', 'M12');
insert into employee values(3, 'Renu', 'Kambire', 'F', 'Manager', 'Retail', 'M13');
insert into employee values(4, 'Atharva', 'Hendre', 'M', 'HR', 'Finance', 'M14');
insert into employee values(5, 'Rutuja', 'Shinde', 'F', 'President', 'Retail', 'M15');

SELECT * from employee;

/* Aggregate function */
/* Count, SUM, AVG, MIN, MAX */
select count(*) from employee; 

select count(empid) from employee where dept = 'Finance';  /*Count */
select Min(Experience) from employee;  /* Min */
select Max(Experience) from employee; /* Max */
select Sum(Experience) from employee; /*sum */
select Avg(Experience) from employee; /*Avg*/ 
#select Avg(Experience) as emp_exr from employee; #emp_exr gives the column name

/* GROUP BY Clause- GROUP BY clause divides a set of rows
into subgroups depending on column or expression values.
The GROUP BY Clause is used with aggregate function such as 
SUM, AVG, MAX, MIN, and COUNT */

#Find the Dept wise employee count
SELECT DEPT,COUNT(*) as employee_count
from employee GROUP BY DEPT;


#find the role wise employee count
SELECT Role,COUNT(*) as employee_count
from employee GROUP BY Role;

#find the gender wise employee count
SELECT Gender, COUNT(*) as employee_count
from employee GROUP BY Gender;

/* HAVING Clause -Each group produced by the GROUP BY clause is
evaluted by the HAVING clause, and if the
result is true, the row is included in the result set */
/*The HAVING clause is added to SQL because the 
WHERE Keyword cannot be used with aggregate function */

/* Retail =18
Finance = 13
HR = 21 */

select * from employee;
SELECT dept, SUM(Experience) as total_experience
From employee GROUP BY dept
Having total_experience >= 10 AND total_experience <= 20;

SELECT Role, SUM(Experience) as total_experience
From employee GROUP BY Role
Having total_experience >= 10 AND total_experience <= 20;

/* Fetch Department wise employee count using
having clause and sort the data */

SELECT Dept, COUNT(empid)
FROM Employee
GROUP BY Dept
Having COUNT(empid) > 2
ORDER BY COUNT(empid);

SELECT DEPT, SUM(Experience) as total_experience FROM employee GROUP BY Dept
HAVING total_experience >= 10 or total_experience <= 30;
