Lab 6 Question 7
================
What’s the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give example queries in SQL to demonstrate. (Feel free to use the CAP2 database t make your points here.)
* A left outer join will give all the results of an inner join (all of the matching entries based on the match condition), but will also carry along all entries from the first of the two joining tables, even if they have no match in the second table. Thinking of these as "left" and "right" tables, every row of the left table will be present in the joined table, but only matches from the right will be present. To fill the blank spaces left by this process, NULLs are inserted.

* A right outer join is the same as a left outer join, but the results from the right table are ensured to be in the join, and are paired with NULL entries wherever they do not have a match in the left table.

* Here are some example queries for a left outer join and a right outer join, using the CAP2 database:


