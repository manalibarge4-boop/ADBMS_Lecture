/*
Not NULL - Ensures that column cannot have a NULL values
UNIQUE - Ensures that a
Uniquely identifies
each row in atable
foreign key - prevents actions that would destroy link between tables
check - ensures that the values in a column satisfies a specific condition
*/
-- Not NULL constraint--
create database company_db;
use company_db;
show databases;
create table Employees(
EmpID int NOT NULL,
FirstName varchar(10),
LastName varchar(10),
EmpAge int, 
Empzone varchar(10));
desc Employees;

insert into Employees (EmpID, FirstName, LastName, EmpAge, Empzone) values(NULL, "Manali", "Barge", 23, "East");     
insert into Employees (EmpID, FirstName, LastName, EmpAge, Empzone) values(2, NULL, "Kambire", 22, "North"), (3, "Gouri", "Shinde", 21, "West"); 

  #Unique key Constraint
create table Employee1(EmpID int Not NULL, FirstName varchar(10), LastName varchar(10),Unique (EmpID));  
Desc Employee1;

insert into Employee1 (EmpID, FirstName, LastName) values(1, "Manali", "Barge");     
insert into Employee1 (EmpID, FirstName, LastName) values(1, NULL, "Kambire"); #duplicate will show error
insert into Employee1 (EmpID, FirstName, LastName) values(2, "Gouri", "Shinde");
Select * from Employee1;   

#Check Constraint while Creating table
create table Employee2(
EmpID int Not NULL, 
FirstName varchar(10), 
LastName varchar(10), 
EmpAge int, Check(EmpAge>20));  

desc Employee2; 

insert into Employee2 (EmpID, FirstName, LastName, EmpAge, salary) values(1, "Manali", "Barge", 23, 4000);
insert into Employee2 (EmpID, FirstName, LastName, EmpAge, salary) values(2, "Gouri", "Shinde", 21, 1000); 
show  create table Employee2;
Alter table Employee2 drop check employee2_chk_2; #to drop the check constraint on salary

Alter table Employee2 add column salary int;
Alter table Employee2 drop salary;

/* Apply Check constraint to the salary column */
Alter table Employee2 Add column salary int, add check(salary >= 5000);

Select * from Employee2;

# NotNULL, Check and Primary key Constraints

create table employee3(
EmpID int NOT NULL,
FirstName varchar(10),
LastName varchar(10),
EmpAge int,
check(EmpAge>20),
primary key(EmpID));

desc employee3;

insert into employee3 (EmpID, FirstName, LastName, EmpAge) values(1, "Manali", "Barge", 23);	
insert into employee3 (EmpID, FirstName, LastName, EmpAge) values(1, "Gouri", "Shinde", 21); #will show error becuase of duplicate primary key
insert into employee3 (EmpID, FirstName, LastName, EmpAge) values(2, "Gouri", "Shinde", 21);

/* Constraint not fully dropped
Dropping only a column level constraint while 
a teble-level constraint remains*/	

-- a check constraint on multiple columns
create table employee4(
EmpID int Primary Key,
FirstName varchar(10),
LastName varchar(10), 
EmpAge int,
Salary int);	

insert into employee4  (EmpID, FirstName, LastName, EmpAge, Salary) values(1, "Manali", "Barge", 23, 5000);	

# to allow naming and definig a check constraint on multiple columns
Alter table employee4 add constraint chk_EmpAge_salary
check(EmpAge>20 AND salary >=5000);
Alter table Employee3 drop check chk_EmpAge_salary;

show create table employee4;	

-- Default Constraint: set a default value for a column if no other value specified

create table Employee4(
EmpID int NOT NULL,
FirstName varchar(10),
Lastname varchar(10),
EmpDept varchar(10) Default 'Operations');

Desc Employee4;  


																																										


                                                                       