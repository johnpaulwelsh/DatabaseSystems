﻿-- John Paul Welsh
-- Database Systems Lab 5

-- Question 1
-- Show the cities of agents booking an order for a customer
-- whose cid is 'c006'. Use joins; no subqueries.
select a.city
  from agents a
       inner join
       orders o
    on o.aid = a.aid
   and o.cid = 'c006';
-- city: New York, Tokyo, Dallas


-- Question 2
-- Show the pids of products ordered through any agent who
-- makes at least one order for a customer in Kyoto, sorted
-- by pid from highest to lowest. Use joins; no subqueries.
select distinct o1.pid
  from orders o1,
       orders o2,
       customers c
 where c.city = 'Kyoto'
   and c.cid  = o2.cid
   and o2.aid = o1.aid;
-- pid: p04, p07, p01, p05, p03


-- Question 3
-- Show the names of customers who have never placed an order.
-- Use a subquery.
select c.name
  from customers c
 where cid not in (select cid
                     from orders);
-- name: Weyland-Yutani


-- Question 4
-- Show the names of customers who have never placed an order.
-- Use an outer join.
select c.name
  from customers c
       left outer join
       orders o
    on c.cid = o.cid
 where o.ordno is null;
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
   and c.city = a.city;
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
 where c.city = a.city;
-- cust_name:   ACME,   Tiptop, Allied, Basics
-- agnt_name:   Otasi,  Otasi,  Smith,  Smith
-- shared_city: Duluth, Duluth, Dallas, Dallas


-- Question 7
-- Show the name and city of customers who live in the city
-- that makes the fewest different kinds of products.
-- (Hint: Use count and group-by on the Products table.)
select c.name,
       c.city
  from customers c,
       (
       select p.city,
              count(p.pid)
         from products p
        group by p.city
        order by count(p.pid) ASC
        limit 1
       ) as prodCounts
 where prodCounts.city = c.city
-- name: Tiptop, ACME
-- city: Duluth, Duluth
