Lab 6 Question 7
================
* A left outer join will give all the results of an inner join (all of the matching entries based on the match condition), but will also carry along all entries from the first of the two joining tables, even if they have no match in the second table. Thinking of these as "left" and "right" tables, every row of the left table will be present in the joined table, but only matches from the right will be present. To fill the blank spaces left by this process, NULLs are inserted.

* A right outer join is the same as a left outer join, but the results from the right table are ensured to be in the join, and are paired with NULL entries wherever they do not have a match in the left table.

* Here is an example query for both a left outer join and a right outer join, using the CAP2 database:

Left outer join (some customers don't have any orders)
```
select *
  from customers c
       left outer join
       orders    o
    on o.cid = c.cid
```

Right outer join (some products have never been ordered)
```
select *
  from orders   o
       right outer join
       products p
    on o.pid = p.pid
```
