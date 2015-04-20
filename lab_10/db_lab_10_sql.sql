-- John Paul Welsh
-- Lab 10

-- Question 1
-- Returns the immediate prerequisites for the passed-in course number.
create or replace function function PreReqsFor(courseNum) returns refcursor
as $$
declare
   -- 
begin
   open $1 for select * from someTable;
   return $1;
end;
$$ language plpgsql;

-- Question 2
-- Returns the courses for which the passed-in course number is an
-- immediate pre-requisite.
create or replace function function IsPreReqFor(courseNum) returns refcursor
as $$
declare
   -- 
begin
   open $1 for select * from someTable;
   return $1;
end;
$$ language plpgsql;
