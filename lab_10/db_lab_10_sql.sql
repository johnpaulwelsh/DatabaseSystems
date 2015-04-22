-- John Paul Welsh
-- Lab 10

-- Question 1
-- Returns the immediate prerequisites for the passed-in course number.
create or replace function PreReqsFor(integer) returns refcursor as
$$
declare
  searchNum integer := $1;
  results   refcursor;
begin
  open results for
    select *
      from courses c
     where c.num in (select p.prereqnum
                       from prerequisites p
                      where p.coursenum = searchNum);
  return results;
end;
$$ language plpgsql;

select PreReqsFor(308);
fetch all from results;

-- Question 2
-- Returns the courses for which the passed-in course number is an
-- immediate pre-requisite.
create or replace function IsPreReqFor(searchNum) returns refcursor as
$$
declare
   -- 
begin
   open $1 for select * from someTable;
   return $1;
end;
$$ language plpgsql;

select *
from prerequisites

select *
from courses