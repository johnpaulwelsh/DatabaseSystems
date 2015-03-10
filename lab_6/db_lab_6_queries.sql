-- John Paul Welsh
-- Database Systems Lab #6

-- Question 1
-- Display the name and city of customers who live in any city
-- that makes the most different kinds of products.
-- (There are two cities that make the most different products.
-- Return the name and city of customers from either one of those.)
select c.name,
       c.city
  from customers c,
       (
       select p.city,
              count(p.pid)
         from products p
        group by p.city
        order by count(p.pid) DESC
        limit 1
       ) as prodCounts
 where prodCounts.city = c.city
-- name: Basics, Allied
-- city: Dallas, Dallas


-- Question 2
-- Display the names of products whose priceUSD is below the
-- average priceUSD, in alphabetical order.
select p.name
  from products p,
       (
       select avg(priceUSD)
         from products
       ) as averagePrice
 where p.priceUSD < averagePrice.avg
 order by p.name ASC
-- name: brush, case, comb, pen, pencil, razor


-- Question 3
-- Display the customer name, cid ordered, and the dollars for all
-- orders, sorted by dollars from high to low.
select cust.name,
       o.dollars
  from (
       select *
         from customers c
        order by c.cid ASC
       ) as cust
       inner join
       orders o
    on o.cid = cust.cid
 order by o.dollars
-- name:    Tiptop, ACME,   Tiptop, Tiptop, ACME,   ACME,   Tiptop, Tiptop, ACME,   Tiptop, Tiptop, Basics, Basics, Allied
-- dollars: 180.00, 400.00, 450.00, 450.00, 460.00, 500.00, 540.00, 540.00, 600.00, 720.00, 720.00, 740.00, 880.00, 1104.00


-- Question 4
-- Display all customer names (in reverse alphabetical order)
-- and their total ordered, and nothing more. Use coalesce to
-- avoid showing NULLs.


-- Question 5
-- Display the names of all customers who bought products from
-- agents based in Tokyo along with the names of the products
-- they ordered, and the names of the agents who sold it to them.


-- Question 6
-- Write a query to check the accuracy of the dollars column in the
-- Orders table. This means calculating Orders.dollars from data
-- in other tables and comparing those values to the values in
-- Orders.dollars. Display all rows in Orders where Orders.dollars
-- is incorrect, if any.

