-- John Paul Welsh
-- Database Systems Lab 5

-- Question 1
-- Show the cities of agents booking an order for a customer
-- whose pid is 'c006'. Use joins; no subqueries.
select a.city
  from agents a
       inner join
       orders o
    on o.aid = a.aid
   and o.cid = 'c006'

-- Question 2
-- Show the pids of products ordered through any agent who
-- makes at least one order for a customer in Kyoto, sorted
-- by pid from highest to lowest. Use joins; no subqueries.
select p.pid
  from agents    a,
       customers c,
       orders    o,
       products  p
 where o.pid  = p.pid
   and o.aid  = a.aid
   and o.cid  = c.cid
   and c.city = 'Kyoto'

-- Question 3
-- Show the names of customers who have never placed an order.
-- Use a subquery.
select customers.name
  from customers
 where cid not in (select cid
                   from   orders)

-- Question 4
-- Show the names of customers who have never placed an order.
-- Use an outer join.
select c.name
  from customers c
       left outer join
       orders o
    on o.cid = c.cid

-- Question 5
-- Show the names of customers who placed at least one order
-- through an agent in their own city, along with those agent(s') names.

-- Question 6
-- Show the names of customers and agents living in the same
-- city, along with the name of the shared city, regardless
-- of whether or not the customer has ever placed an order
-- with that agent.

-- Question 7
-- Show the name and city of customers who live in the city
-- that makes the fewest different kinds of products.
-- (Hint: Use count and group by on the Products table.)
