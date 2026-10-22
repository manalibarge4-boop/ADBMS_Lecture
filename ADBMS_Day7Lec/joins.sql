/* Basics of Join queries */
create database Basicjoin;
use Basicjoin;

create table employees (
employee_id INT PRIMARY KEY,
ename VARCHAR(50));
desc employees;

insert into employees(employee_id, ename)
 values(101, 'Raghav'), 
       (102, 'Raashi'),
       (103, 'Rohan'),
       (104, 'Mohan');
select * from employees;
select * from projects;

create table projects(
project_id INT PRIMARY KEY,
pname varchar(50),
employee_id int, foreign key (employee_id) references employees(employee_id));

insert into projects (project_id, pname, employee_id)
values (1, 'Project A', 101),
       (2, 'Project B', 102),
       (3, 'Project C', 103),
       (4, 'Project D', 104);
Select * from projects;
insert into employees
values (5, 'sanjay'),
       (6, 'jay');
Select * from employees;
 /* INNER JOIN */
 
 Select * from employees
 join projects
 on employees.employee_id = projects.employee_id;
 
 /* fetch the employee name and the project name 
 they belong to */
 
 SELECT e.ename, p.pname from employees e #e.ename = e is object of employee table
 Inner JOIN projects p
 ON e.employee_id = p.employee_id;
 
 SELECT e.ename, p.pname from employees e #e.ename = e is object of employee table
 Right JOIN projects p
 ON e.employee_id = p.employee_id;
 
 SELECT e.ename, p.pname from projects p 
 Right JOIN employees e
 ON e.employee_id = p.employee_id;
 
 SELECT e.employee_id, e.ename, p.pname from employees e
 LEFT join projects p
 on e.employee_id = p.employee_id;
  

 insert into projects values(105,'project E', null);
 insert into projects values(106,'project F', null);
 
 /* left join = inner join +
 any additional records in the left table */
 
 /*Right join */
 /*all matching from employee*/
 
 /*Full outer join using Union */
 /* display all matching and non-matching data 
 from both tables */
 
 select * from employees
 LEFT JOIN projects
 ON employees.employee_id = projects.employee_id
 UNION
 Select * from employees
 LEFT JOIN projects
 ON employees.employee_id = projects.employee_id;
 
 /* Display employee name who has not been 
 assigned any project */
 
 SELECT employees.ename,projects.pname
 FROM employees
 LEFT JOIN projects
 ON employees.employee_id = projects.employee_id
 WHERE projects.employee_id IS not NULL; 
 
 SELECT employees.ename,projects.pname
 FROM employees
 LEFT JOIN projects
 ON employees.employee_id = projects.employee_id
 WHERE projects.employee_id IS NULL;   #NULL data from employees , not according to project because of Left Join
 
 
 
 
 
 