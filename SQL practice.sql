
-- sales data---

create table Salesman
(salesman_id int primary key,
name varchar(50),
city varchar(50),
commission decimal(10,2));

insert into Salesman
values(5001,'james hooq','new york',0.15),(5002,'nail knite','paris',0.13),
(5005,'pit alex','london',0.11),(5006,'mc lyon','paris',0.14),('5003','lauson hen',null,0.12),
(5007,'paul adam','rome',0.13);

create table customers
(customer_id int primary key,
customer_name varchar(50),
city varchar(50),
grade decimal(10,2),
salesman_id int,foreign key(salesman_id) references Salesman(salesman_id));

insert into customers
values(3002,'nick rimando','new york',100,5001),(3005,'graham zusi','california',200,5002),
(3001,'brad guzan','london',null,null),(3004,'fabia johns','paris',300,5006),
(3007,'brad davis','new york',200,5001),(3009,'geoff camero','berlin',100,null),
(3008,'julian green','london',300,5002),(3003,'jozy altidor','moncow',200,5007);

create table orders
(order_no int(10),
purch_amt decimal(10,2),
order_date date,
customer_id int,foreign key(customer_id) references customers(customer_id),
salesman_id int,foreign key(salesman_id) references Salesman(salesman_id));

insert into orders
values(70001,150.5,'2016-10-05',3005,5002),(70009,270.65,'2016-09-10',3001,null),
(70002,65.26,'2016-10-05',3002,5001),(70004,110.5,'2016-08-17',3009,null),
(70007,948.5,'2016-09-10',3005,5002),(70005,2400.6,'2016-07-27',3007,5001),
(70008,5760,'2016-09-10',3002,5001),(70010,1983.43,'2016-10-10',3004,5006),
(70003,2480.4,'2016-10-10',3009,null),(70012,250.45,'2016-06-27',3008,5002),
(70011,75.29,'2016-08-17',3003,5007);

select*from Salesman;
select*from customers;
select*from orders;

-- Questions----
-- Q1) Query 1
-- Display name and commission of all the salesmen.
select name, commission from Salesman;

-- Query 2
-- • Retrieve salesman id of all salesmen from orders table without any repeats
select distinct(salesman_id) from orders;

-- Query 3
-- • Display names and city of salesman, who belongs to the city of Paris.
select name,city from Salesman where city='paris';

-- Query 4
-- • Display all the information for those customers with a grade of 200. 
select* from customers where grade=200;

-- Query 5 • Display the order number, order date and the purchase amount for orders(s) which will delivered by the salesman with ID 5001
select order_no,order_date,purch_amt from orders where salesman_id=5001;

-- Query 6
-- Display all the customers, who are either belongs to the city New York or not had a grade above 100
select *from customers where city='new york' or not grade >100;

-- Query 6
-- Find those salesmen with all information who gets the commission within a range of 0.12 and 0.14.
select salesman_id,name,commission from Salesman where(commission>0.12 and commission <0.14);
select salesman_id,name,commission from Salesman where commission between 0.12 and 0.14;

-- Query 7
--  Find all those customers with all information whose names are ending with the letter 'n'.
select* from customers where customer_name like '%n';

-- Query 8
-- Find those salesmen with all information whose name containing the 1st character is 'N' and the 4th character is 'l' and rests may be any character
select* from Salesman where name like 'n__l%';

-- Query 9
-- Find that customer with all information who does not get any grade except NULL
select*from customers where grade is null;






