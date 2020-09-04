use Mansi_activities;
-- Activity 7
Select sum(purchase_amount) as "TOTAL" from orders;

Select avg(purchase_amount) as "AVERAGE" from orders;

Select max(purchase_amount) as "MAXIMUM" from orders;

Select min(purchase_amount) as "MINIMUM" from orders;

Select count(salesman_id) as "COUNT" from orders;

Select * from orders;

-- Activity 8

Select customer_id, max(purchase_amount) as "MAX AMOUNT" from orders group by customer_id;

Select salesman_id, order_date, max(purchase_amount) as "Max AMOUNT" from orders where order_date = '2012-08-17' group by salesman_id, order_date;

Select customer_id, order_date, max(purchase_amount) as "Max amount" from orders group by customer_id,order_date having max(purchase_amount) in (2030,3450,5760,6000);

-- Activity 9

-- Create the customers table
create table customers (
    customer_id int primary key, customer_name varchar(32),
    city varchar(20), grade int, salesman_id int);

-- Insert values into it
insert into customers values 
(3002, 'Nick Rimando', 'New York', 100, 5001), (3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002), (3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006), (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007), (3001, 'Brad Guzan', 'London', 300, 5005);

Select * from salesman;
Select * from customers;
Select * from orders;

Select customers.customer_id, customers.customer_name, salesman.salesman_id, salesman.name  
from customers inner join salesman on customers.salesman_id = salesman.salesman_id;

Select customers.customer_id, customers.customer_name, customers.city, customers.grade, 
salesman.name as "Salesman" ,  salesman.city as "Salesman's city"
from customers left outer join salesman on customers.salesman_id = salesman.salesman_id 
where customers.grade <300 order by customers.customer_id;

Select customers.customer_id, customers.customer_name, 
salesman.name as "Salesman", salesman.commission
from customers inner join salesman on customers.salesman_id = salesman.salesman_id 
where salesman.commission >12;

Select o.order_no, o.order_date, o.purchase_amount, c.customer_name, s.name as "Salesman", s.commission
from orders o 
inner join customers c on o.customer_id = c.customer_id
inner join salesman s on o.salesman_id = s.salesman_id;

-- Activity 10

Select * from salesman;
Select * from customers;
Select * from orders;

Select * from orders where salesman_id in 
(Select distinct salesman_id from orders where customer_id = 3007);

Select * from orders where salesman_id in
(Select salesman_id from salesman where city = 'NewYork');

Select grade, COUNT(customer_id) as "CUSTOMER COUNT" from customers group by grade having grade > 
(Select AVG(grade) as "AVERAGE OF NEWYORK" from customers where city = 'New York');

Select * from orders where salesman_id in
(Select salesman_id from salesman where commission =
(Select MAX(commission) from salesman)); 

-- Activity 11

Select * from salesman;
Select * from customers;
Select * from orders;

Select customers.customer_id, customers.customer_name from customers
where 1<(Select count(*) from orders where customers.customer_id = orders.customer_id)
UNION
Select salesman_id, salesman.name as "Salesman" from salesman
where 1<(Select count(*) from orders where salesman.salesman_id = orders.salesman_id)
order by customer_name;

Select distinct customers.customer_id, customers.customer_name, salesman.salesman_id, salesman.name as "Salesman"
from orders 
inner join customers on customers.customer_id = orders.customer_id 
inner join salesman on salesman.salesman_id = orders.salesman_id 
where 1<(Select count(*) from orders where customers.customer_id = orders.customer_id) 
and 1<(Select count(*) from orders where salesman.salesman_id = orders.salesman_id)
order by customer_name;

SELECT a.salesman_id, name, order_no, 'highest on', order_date FROM salesman a, orders b
WHERE a.salesman_id=b.salesman_id
AND b.purchase_amount=(SELECT MAX(purchase_amount) FROM orders c WHERE c.order_date = b.order_date)
UNION
SELECT a.salesman_id, name, order_no, 'lowest on', order_date FROM salesman a, orders b
WHERE a.salesman_id=b.salesman_id
AND b.purchase_amount=(SELECT MIN(purchase_amount) FROM orders c WHERE c.order_date = b.order_date);

Select salesman.salesman_id, salesman.name as "Salesman", orders.order_no, orders.order_date,purchase_amount
from orders 
inner join salesman on salesman.salesman_id = orders.salesman_id 
WHERE orders.purchase_amount=(SELECT MAX(purchase_amount) FROM orders WHERE orders.order_date = orders.order_date)
UNION
Select salesman.salesman_id, salesman.name as "Salesman", orders.order_no, orders.order_date, purchase_amount
from orders
inner join salesman on salesman.salesman_id = orders.salesman_id 
WHERE orders.purchase_amount=(SELECT MIN(purchase_amount) FROM orders WHERE orders.order_date = orders.order_date);


