-- starts a new transaction.
/* BEGIN;
-- or
START TRANSACTION; --To execute multiple statements as a single transaction,
we must explicitly start the transaction.
COMMIT:- Saves all changes made during the transaction.
ROLLBACK: - Undoes all changes made during the transaction
SAVEPOINT :- sets a savepoint within a transaction to rollback to later
ROLLBACK TO SAVEPOINT:- Rolls back to a specific savepoint without 
affecting earlier changes. */

create database TCL;
use TCL;

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(100),
status VARCHAR(50)
);

set autocommit=0; /* in mySQL auto commit mode is enbled
by default which means whenever we execute anu sql statement 
is automatically commited */
/* so in such cases succeded transactions are automatically commited.
to disable the auto commit mode we are using this 
also we can not disabled the autocommit mode of DDL commands.
In many DBMS it is disabled by default */

-- start transaction

BEGIN; #start 

INSERT INTO orders VALUES (101, 'Geet', 'Pending');
INSERT INTO orders VALUES (102, 'Bob', 'Pending');
Update orders set customer_name="Raj"
 where order_id=102;

truncate table orders;
Select * from orders;
commit;
rollback;
desc orders;

# step 1: Insert a few orders
INSERT INTO orders VALUES (103, 'Om', 'Pending');
INSERT INTO orders VALUES (104, 'Sahil', 'Pending');
SAVEPOINT sp1; #created savepoint1
Select * from orders;

# step 2: Update one order
UPDATE orders set customer_name= "Dhanshri" 
where order_id=101;
SAVEPOINT sp2; 
rollback to savepoint sp1; 
rollback;

# step 3: Delete another order
DELETE FROM orders WHERE order_id = 102;
SAVEPOINT sp3;

-- we want to undo the delete but keep the update
rollback to savepoint sp2;
select * from orders;
rollback;


