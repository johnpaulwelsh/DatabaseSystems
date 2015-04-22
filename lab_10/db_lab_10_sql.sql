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

select PreReqsFor(308, 'results');
fetch all from results;

-- Question 2
-- Returns the courses for which the passed-in course number is an
-- immediate pre-requisite.
create or replace function IsPreReqFor(integer) returns refcursor as
$$
declare
   searchNum integer := $1;
   results   refcursor;
begin
   open results for
     select *
       from courses c
      where c.num in (select p.coursenum
                        from prerequisites p
                       where p.prereqnum = searchNum);
   return results;
end;
$$ language plpgsql;

select IsPreReqFor(308, 'results');
fetch all from results;

select *
from prerequisites

select *
from courses