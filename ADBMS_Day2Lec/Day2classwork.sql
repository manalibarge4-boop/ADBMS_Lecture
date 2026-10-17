create database college;
show databases;
use college;
create table Employees(
EmpID int,
FirstName varchar(10),
LastName varchar(10),
EmpAge int, 
Empzone varchar(10));

insert into Employees (EmpID, FirstName, LastName, EmpAge, Empzone) values(1, "Manali", "Barge", 23, "East");     
insert into Employees (EmpID, FirstName, LastName, EmpAge, Empzone) values(2, "Renu", "Kambire", 22, "North"), (3, "Gouri", "Shinde", 21, NULL); 

update Employees set Empzone= 'East' where EmpID= 3;
update Employees set EmpAge=25,Empzone="west" where EmpID=2;

select * from Employees; 
               
                       
desc Employees;                       
