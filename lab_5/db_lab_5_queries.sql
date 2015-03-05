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
-- city: New York, Tokyo, Dallas


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
order by p.pid DESC
-- pid: p07, p01, p01
-- Unless they mean through any agent who's ever made an order
-- to the Kyoto Acme, but not necessarily just the orders with
-- that customer only. In that case, screw you.


-- Question 3
-- Show the names of customers who have never placed an order.
-- Use a subquery.
select customers.name
  from customers
 where cid not in (select cid
                     from orders)
-- name: Weyland-Yutani


-- Question 4
-- Show the names of customers who have never placed an order.
-- Use an outer join.
select c.name
  from customers c
       left outer join
       orders o
    on o.cid is null
-- name: Weyland-Yutani


-- Question 5
-- Show the names of customers who placed at least one order
-- through an agent in their own city, along with those agent(s') names.
select c.name cust_name,
       a.name agnt_name
  from customers c,
       agents    a,
       orders    o
 where o.aid  = a.aid
   and o.cid  = c.cid
   and c.city = a.city
-- cust_name: Tiptop, Tiptop
-- agnt_name: Otasi,  Otasi


-- Question 6
-- Show the names of customers and agents living in the same
-- city, along with the name of the shared city, regardless
-- of whether or not the customer has ever placed an order
-- with that agent.
select c.name cust_name,
       a.name agnt_name,
       c.city shared_city
  from customers c,
       agents    a
 where c.city = a.city
-- cust_name:   ACME,   Tiptop, Allied, Basics
-- agnt_name:   Otasi,  Otasi,  Smith,  Smith
-- shared_city: Duluth, Duluth, Dallas, Dallas


-- Question 7
-- Show the name and city of customers who live in the city
-- that makes the fewest different kinds of products.
-- (Hint: Use count and group by on the Products table.)

-- This is definitely the one that needa a subquery. Goddammit.

-- name: Tiptop, ACME
-- city: Duluth, Duluth