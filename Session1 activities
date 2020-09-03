-- Activity 1
Create DATABASE Mansi_activities;

use Mansi_activities;

create table salesman (
salesman_id int primary key,
name varchar(32),
city varchar(32),
commission int);

describe salesman;

-- Activity 2

Insert into salesman values (5001, 'James Hoog','NewYork',15);

Insert into salesman values (5002, 'Nail Knite','Paris',13),
(5005, 'Pit Alex ','London',11),
(5006, 'McLyon ','Paris',14),
(5007, 'Paul Adam','Rome',13),
(5003, 'Lauson Hen','San Jose',12)
;

Select * from salesman;

-- Activity 3
Select salesman_id, city from salesman;

Select * from salesman where city = 'Paris';

Select salesman_id, commission from salesman where name = 'Paul Adam';

-- Activity 4
Alter table salesman add Grade int;

-- Alter table salesman drop DateOfBirth;
-- Update salesman set DateOfBirth = '1985/09/01' where salesman_id = 5001;
-- Update salesman set Grade = 1 where salesman_id = 5001;

Update salesman set Grade = 100;

Select * from salesman;

-- Activity 5


Update salesman set Grade = 200 where city = 'Rome';

Update salesman set Grade = 300 where name = 'James Hoog';

Update salesman set name = 'Pierre' where name = 'McLyon ';

Select * from salesman;

-- Activity 6

-- Create a table named orders
create table orders(
    order_no int primary key, purchase_amount float, order_date date,
    customer_id int, salesman_id int);

-- Add values to the table
insert into orders values
(70001, 150.5, '2012-10-05', 3005, 5002), (70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001), (70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002), (70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-08-15', 3002, 5001), (70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003), (70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007), (70013, 3045.6, '2012-04-25', 3002, 5001);

Select * from orders;

Select distinct salesman_id from orders;

Select order_no,order_date from orders order by order_date;

Select order_no,purchase_amount from orders order by purchase_amount desc;

Select * from orders where purchase_amount<500;

Select * from orders where purchase_amount between 1000 and 2000;

