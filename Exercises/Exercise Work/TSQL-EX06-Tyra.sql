-- Name: Tyra Oberholzer
-- File: TSQL-EX06-Tyra.sql
-- Date: August 5, 2020

create database ClassicCars;

Use ClassicCars;

Question #1
-- Create an appropriate table schema for all data files (the text files). Include primary and 
-- foreign keys, plus any other constraints that you feel necessary.
Question #2
-- Import the CSV data into the tables you just created.

--ProductLines Table
drop table if exists ProductLines 

create table ProductLines
(
	productLine varchar(200)
		constraint PK_ProductLines primary key,
	textDescription varchar(1000),
	htmlDescription varchar(500),
	image varchar(1000)
);

BULK INSERT ProductLines 
FROM 'C:\Users\Tyra\quantico06\ISTA420\Classic Cars\ProductLines.csv'
WITH
(
DATAFILETYPE = 'char',
FORMAT = 'CSV',
ROWTERMINATOR = '\n'
);


--Products
drop table if exists Products

create table Products
(
	productCode varchar(300)
		constraint PK_Products primary key,
	productName varchar(300),
	productLine varchar(300),
	productScale varchar(300),
	productVendor varchar(300),
	productDescription varchar(500),
	quantityInStock varchar(300),
	buyPrice varchar(300),
	MSRP varchar(1000)
);

BULK INSERT	 Products
FROM 'C:\Users\Tyra\quantico06\ISTA420\Classic Cars\Products.csv'
WITH
(
DATAFILETYPE = 'char',
FORMAT = 'CSV',
ROWTERMINATOR = '\n'
);


--OrderDetails
drop table if exists OrderDetails

create table OrderDetails
(
	orderNumber varchar(300),
		constraint FK_Orders
		foreign key (orderNumber)
		references Orders(orderNumber),
	productCode varchar(300),
		constraint FK_Products
		foreign key (productCode) 
		references Products(productCode),
	quantityOrdered smallint not null,
	priceEach money not null,
	orderLineNumber varchar(300)
);

BULK INSERT	 OrderDetails
FROM 'C:\Users\Tyra\quantico06\ISTA420\Classic Cars\OrderDetails.csv'
WITH
(
DATAFILETYPE = 'char',
FORMAT = 'CSV',
ROWTERMINATOR = '\n'
);

--Orders
drop table if exists Orders;

create table Orders
(
	orderNumber varchar(300)
		constraint PK_Orders primary key,
	orderDate date,
	requiredDate date,
	shippedDate date,
	status varchar(300),
	comments varchar(300),
	customerNumber varchar(300)
);

BULK INSERT	 Orders
FROM 'C:\Users\Tyra\quantico06\ISTA420\Classic Cars\Orders.csv'
WITH
(
DATAFILETYPE = 'char',
FORMAT = 'CSV',
ROWTERMINATOR = '\n'
);


--Customers
drop table if exists Customers;

create table Customers
(
	customerNumber varchar(300)
		constraint PK_Customers primary key,
	customerName varchar(300),
	contactLastName varchar(300),
	contactFirstName varchar(300),
	phone varchar(300),
	addressLine1 varchar(300),
	addressLine2 varchar(300),
	city varchar(300),
	state varchar(300),
	postalCode varchar(300),
	country varchar(300),
	saleRepEmployeeNumber varchar(300),
	creditLimit varchar(300)
);

BULK INSERT	 Customers
FROM 'C:\Users\Tyra\quantico06\ISTA420\Classic Cars\Customers.csv'
WITH
(
DATAFILETYPE = 'char',
FORMAT = 'CSV',
ROWTERMINATOR = '\n'
);


--Employees
drop table if exists Employees

create table Employees
(
	employeeNumber int
		constraint PK_Employees primary key,
	lastName varchar(300),
	firstName varchar(300),
	extension varchar(300),
	email varchar(300),
	officeCode varchar(300),
	reportTo varchar(300),
	jobTitle varchar(300)
);

BULK INSERT	 Employees
FROM 'C:\Users\Tyra\quantico06\ISTA420\Classic Cars\Employees.csv'
WITH
(
DATAFILETYPE = 'char',
FORMAT = 'CSV',
ROWTERMINATOR = '\n'
);

--Offices
drop table if exists Offices;

create table Offices
(
	officeCode varchar(300)
		constraint PK_Offices primary key,
	city varchar(300),
	phone varchar(300),
	addressLine1 varchar(300),
	addressLine2 varchar(300),
	state varchar(300),
	country varchar(300),
	postalCode varchar(300),
	territory varchar(300)
);

BULK INSERT	 Offices
FROM 'C:\Users\Tyra\quantico06\ISTA420\Classic Cars\Offices.csv'
WITH
(
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

--Payments
drop table if exists Payments;

create table Payments
(
	customerNumber varchar(300),
		constraint FK_Customers
		foreign key (customerNumber) 
		references Customers(customerNumber),
	checkNumber varchar(300)
		constraint PK_Payments primary key,
	paymentDate date,
	amount money
);

BULK INSERT	 Payments
FROM 'C:\Users\Tyra\quantico06\ISTA420\Classic Cars\Payments.csv'
WITH
(
DATAFILETYPE = 'char',
FORMAT = 'CSV',
ROWTERMINATOR = '\n'
);




Question #3
-- Perform the following queries:
--		(a) How many distinct products does ClassicModels sell?
select count(productName) as totalDistinctPdcts from Products;

--		(b) Report the name and city of customers who don't have sales representatives?
select customerName, city, saleRepEmployeeNumber from Customers where saleRepEmployeeNumber like 'null';

--		(c) What are the names of executives with VP or Manager in their title? Use the	CONCAT
--			function to combine the employee's first name and last name into a single field for
--			reporting.
select firstName, lastName, jobTitle from Employees where jobTitle like '%VP%' or jobTitle like '%Man%';

--		(d) Which orders have a value greater than $5,000?
select sum(quantityOrdered * priceEach) as totalValue from OrderDetails group by productCode;

--		(e) Report the account representative for each customer.
select customerNumber, customerName, saleRepEmployeeNumber from Customers;

--		(f) Report total payments for Atelier graphique.
select c.customerName, count(p.paymentDate) as totalPayments from Payments p join  Customers c on p.customerNumber=c.customerNumber where c.customerName like '%telier graphiqu%' group by c.customerName, p.customerNumber;

--		(g) Report the total payments by date
select paymentDate, count(paymentDate) as totalPayments from Payments group by paymentDate order by paymentDate;

--		(h) Report the products that have not been sold.
select p.productName from Products p left join OrderDetails od on p.productCode=od.productCode where od.productCode is null;

--		(i) List the amount paid by each customer.
select p.amount, c.customerName from payments p join Customers c on p.customerNumber=c.customerNumber group by p.amount, p.customerNumber, c.customerName;

--		(j) List products sold by order date.
select od.productCode, o.orderDate from OrderDetails od join Orders o on od.orderNumber=o.ordernumber order by od.productCode, o.orderdate;

--		(k) List the order dates in descending order for orders for the 1940 Ford Pickup Truck.
select p.productName, o.orderdate from (orderdetails od join products p on p.productcode=od.productcode) join orders o on od.ordernumber=o.ordernumber where p.productName like '1940 Ford Pickup Truck' order by o.orderdate desc;

--		(l) List the names of customers and their corresponding order number where a particular order from
--		that customer has a value greater than $25,000?
select top (213) c.customerName, od.ordernumber, sum(od.quantityordered * od.priceEach) as totalValue from (customers c join orders o on c.customernumber=o.customerNumber) join orderdetails od on o.ordernumber=od.orderNumber group by c.customerName, od.orderNumber order by totalValue desc;

--		(m) What is the difference in days between the most recent and oldest order date in the Orders file?
select distinct datediff(DAY, '2003/01/06', '2005/05/31') as totalDiffDays from orders;

--		(n) Compute the average time between order date and ship date for each customer ordered by the
--		largest dierence.
select o.customernumber, datediff(day, o.orderdate, o.shippedDate) Date_Diff from orders as o order by Date_Diff desc;