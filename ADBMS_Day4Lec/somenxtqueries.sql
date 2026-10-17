create database user;
Show databases;

use user

create table customer(
Custid int, 
custname varchar(15), 
City varchar(10), 
product varchar(15), 
Price int);

desc customer;

insert into customer values(101, 'Manali', 'satara', 'product1', 1500);
insert into customer values(102, 'Gouri', 'pune', 'product2', 1000);
insert into customer values(103, 'Renu', 'satara', 'product3', 900);

select * from customer;
Select Custid,custname,City from customer;

Select * from customer
where Custid = 103;

Select * from customer
where Custid = 103 or custid = 101; #id and used the table displays null

alter table customer 
add primary key(Custid);

create table CloneTable as select * from customer;
select * from CloneTable;
#you can create clone table of existing table to display same data
drop table CloneTable;

select custname, city from customer;

select custname, city from customer 
where Custid=101;

select custname, product, price from customer
where price>1000;

select * from customer 
where city='pune';

/* sorting data using Order by single column */

select * from customer order by price; #when you dont mention it bydefault asc order
select * from customer order by price desc;

#sorting data order by multiple columns
select * from customer order by city, price; #it gives the priority to first column to sort, it can not sort 2 columns at a time
select * from customer order by price, city;

select * from customer order by city desc, price asc; #it sorted by desc order only 

/* Single-row function */
/* case Conversion function */

select upper(custname), lower(product) from customer
where Custid<103; /* uppercase & lower case function*/

select upper(custname), lower(product) from customer; # if you dont wanna give condition

alter table customer
add column LastName varchar(15);

update customer
set LastName = 'Barge'
where Custid = 101;

update customer
set LastName = 'Shinde'
where Custid = 102;

update customer
set LastName = 'Kambire'
where Custid = 103;

/* concat two column */
select concat(custname,' ',LastName) from customer; #'' for space between custname and LastnName
select concat(custname,' ',LastName) as Fullname from customer;

/* use of SUBSTR and INSTR function */
select * from customer;
select substr(custname,1,3) from customer;
select substr(custname,0,3) from customer; #displays blank, every data should start from 1
select substr(custname,1,0) from customer; # samas above 
select substr(custname,1,1) from customer; #displays only first letter

/* Instring query */

select instr(custname, 'a') as position from customer; #displays position of a in custname ##

select substr(custname, 1,2),
instr(custname, 'g') from customer; # it shows the 1 and 2nd letter of custname and displays the position of g in custname

select substr(custname,1,2) as Substring,
instr(custname, 'g') as inserting from customer; #heading will be substring in that first 2 letter of custname will display and 2nd column will be inserting where 








