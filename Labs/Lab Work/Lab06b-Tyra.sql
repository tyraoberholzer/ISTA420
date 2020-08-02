-- 1. Create a list of every country where we have either a customer or a suppliers.

select c.country from customers c
union
select s.country from suppliers s;


-- 2. Create a list of every city and country where we have either a customer or a supplier.

select c.city, c.coutnry from customers c
union
select s.city, s.country from suppliers s;


-- 3. Create a list of every country where we have both a customer and a supplier.

select c.country from customers c
intersect
select s.country from suppliers s;


-- 4. Create a list of ever city and country where we have both a customer and a supplier.

select c.city, c.country from customers c
intersect
select s.city, s.country from suppliers s;


-- 5. Create a list of every country where we have customers but not suppliers.

select c.country from customers c
except
select s.country from suppliers s;


-- 6. Create a list of every country where we have suppliers but not customers.

select s.country from suppliers s
except
select c.country from customers c;


-- 7. Create a list of every country where we have suppliers but not customers and where we have customers but not suppliers. Do not include any country where we have both suppliers and customers.

select c.country from customers c
except
select s.country from suppliers s
union
select s.country from suppliers s
except
select c.country from customers c;