-- John Paul Welsh
-- Database Systems Lab #4

-- Question 1
-- Get the cities of agents booking an order for a customer
-- whose pid is 'c006'
select city
from   agents
where  aid in (select aid
               from   orders
               where  orders.cid = 'c006'
              )

-- Question 2
-- Get the pids of products ordered through any agent who takes
-- at least one order from a customer in Kyoto, sorted by pid
-- from highest to lowest
select pid
from   products
order by pid desc

-- Question 3
-- Get the cids and names of customers who did not place an order
-- through agent a03
select cid, name
from   customers

-- Question 4
-- Get the cids of customers who ordered both product p01 and p07

-- Question 5
-- Get the pids of products NOT ordered by any customers who placed
-- any order through agent a05

-- Question 6
-- Get the name, discounts, and city for all customers who place
-- orders through agents in Dallas or New York

-- Question 7
-- Get all customers who have the same discount as that of any
-- customers in Dallas or London
