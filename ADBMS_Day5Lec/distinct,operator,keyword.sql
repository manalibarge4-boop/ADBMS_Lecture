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

/* select DISTINCT Keyword */
select distinct dept from employee order by dept; #distinct removes the duplicate value ,, also using order by cause of sorting it alphabetically result will be finance, retail
select distinct role from employee order by role;


 -- AND Operator -- 
/* AND operator: this operator is a logical operator that combines two or more
boolean expressions and return 1, 0, or null. 
The AND operator is used for filtering data with the WHERE clause */

select * from employee where role = 'President' and dept = 'HR';
/* Your query searches for an employee whose role is exactly Presindent and whose department is HR.
No employee matches both conditions, so the output is:
Query executed successfully
Empty result set — 0 rows returned */

select * from employee where role = 'President' and dept = 'Retail';

-- OR Operator --
/* OR operator: the OR operator is a logical operator that combines 2 boolean 
expressions and return (true) 1 if either of the expressions is true.alter
The OR operator is used for filtering data with where clause */

select * from employee where role = 'Manager' or role = 'Team leader';

/* IN operator : */
Select * from employee where role in ('President','Manager');
Select * from employee where role in ('TM','Manager');
Select * from employee where role in ('TM','CEO');

/* NOT IN : the not in operator is formed by combining the not and in operators. */
Select * from employee where role not in ('President', 'Manager');

-- Between Operator --
/* Between Operator: The between operator is a logical operator that determines whether 
a value belongs in a range.
The Between operator returns null if the value low or high is null */

alter table employee 
add column Experience int;
desc employee;

update employee set Experience = 8 where empid = 1;
update employee set Experience = 5 where empid = 2;
update employee set Experience = 10 where empid = 3;
update employee set Experience = 4 where empid = 4;
update employee set Experience = 7 where empid = 5;
update employee set Experience = 6 where empid = 6;

Select * from employee;
Select * from employee where Experience between 6 and 10;
Select * from employee where Experience = 5 or Experience = 10;

-- Like Operator --
/* Like Operator: The LIKE Operator is a logical operator that determines whether 
or not a string contains a specified pattern */
Select * from employee where last_name like 'A%';
UPDATE employee
SET last_name = 'Ahire'
WHERE empid = 5;
Select * from employee;

Select * from employee where last_name like 'B%';

-- Limit Operator --
/* Limit Operator: The LIMIT clause in the select statement
is used to limit the number of rows returned */
Select * from employee;
select * from employee order by Experience limit 5; #Sort employees by their experience in ascending order, then display only the first 5 rows.
select * from employee order by Experience limit 3; 

-- IS NULL --
/* IS NULL : the is null operator determines whether or not a value is null,
The experience returns 1(true) if the values is NULL */
insert into employee values();