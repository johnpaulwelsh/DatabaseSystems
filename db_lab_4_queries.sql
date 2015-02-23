-- John Paul Welsh
-- Database Systems Lab #4

-- Question 1
select city
from   agents
where  aid in (select aid
               from   orders
               where  orders.cid = 'c006'
              )

-- Question 2
