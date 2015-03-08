Lab 4 Question 8
================

* Check constraints are conditions that are put on tables, that limit the values that can be put into that column. They are a worthwhile feature because they enforce user-created rules on the database side, and takes responsibility of error-checking away from the user and gives it to the database software.

* An example of a good check constraint is to enforce that a person's age is greater than or equal to 0. No human being can be less than 0 years old, so the database should enforce that rule and prevent accidentally (or intentionally) entering in a negative age.

* A bad check constraint is one that is overly limiting on the data being entered. For example, if we have a database of college courses and a column for "semester that a class is offered", and we limit it to include only the strings 'winter', 'spring', and 'fall', this would not allow anything to denote the season of summer. While the school in question might not offer summer sessions now, they might in the future, especially in light of the number of people who will be failing Algorithms this semester. Not me of course, I'm great.