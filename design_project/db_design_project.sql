-- John Paul Welsh
-- Galactic Empire Design Project

-- Table Drops --
-----------------

DROP TABLE IF EXISTS alliedOrgs;
DROP TABLE IF EXISTS enemyOrgs;
DROP TABLE IF EXISTS organizations;
DROP TABLE IF EXISTS jedi;
DROP TABLE IF EXISTS sith;
DROP TABLE IF EXISTS soldiers;
DROP TABLE IF EXISTS administrators;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS bases;
DROP TABLE IF EXISTS beings;
DROP TABLE IF EXISTS habitats;

DROP VIEW IF EXISTS cloneSoldiers;
DROP VIEW IF EXISTS nonEmployees;
DROP VIEW IF EXISTS humanBeings;
DROP VIEW IF EXISTS neutralOrgs;

-- Create Statements --
-----------------------

-- Habitats (equivalent to planets, but inclusive of moons) --
CREATE TABLE habitats (
  habitatname text not null,
  region      text,
  sector      text,
  sys         text,
  primary key(habitatname)
);

-- Living Beings (equivalent to people, but more inclusive) --
CREATE TABLE beings (
  bid         char(4) not null,
  lastname    text,
  firstname   text,
  homehabitat text references habitats(habitatname),
  species     text,
  birthdate   date,
  primary key(bid)
);

-- Jedi --
CREATE TABLE jedi (
  bid        char(4) not null references beings(bid),
  sabercolor text,
  primary key(bid)
);

-- Sith --
CREATE TABLE sith (
  bid        char(4) not null references beings(bid),
  sabercolor text,
  primary key(bid)
);

-- Empire bases --
CREATE TABLE bases (
  baseid      char(5) not null,
  basename    text,
  habitatname text,
  primary key(baseid)
);

-- Empire employees --
CREATE TABLE employees (
  bid           char(4) not null references beings(bid),
  eid           char(4),
  stationbaseid char(5) references bases(baseid),
  salaryGCS     numeric(10,2),
  primary key(eid)
);

-- Administrative employees --
CREATE TABLE administrators (
  adminid        char(4) not null references employees(eid),
  baseassignment char(5) references bases(baseid),
  primary key(adminid)
);

-- Empire soldiers --
CREATE TABLE soldiers (
  soldid        char(4) not null references employees(eid),
  isclone       boolean,
  battlesfought int,
  primary key(soldid)
);

-- Established organizations all across the galaxy --
CREATE TABLE organizations (
  orgid   char(3) not null,
  orgname text,
  primary key(orgid)
);

-- Organizations that are allied with the Empire --
CREATE TABLE alliedOrgs (
  orgid          char(3) not null references organizations(orgid),
  leader         char(4) references beings(bid),
  lasttransmdate date,
  primary key(orgid)
);

-- Organizations that are enemies to the Empire --
CREATE TABLE enemyOrgs (
  orgid            char(3) not null references organizations(orgid),
  leader           char(4) references beings(bid),
  lastactivitydate date,
  primary key(orgid)
);

-- Sample Data --
-----------------

-- Insert habitats --
INSERT INTO habitats(habitatname, region, sector, sys)
             VALUES('Alderaan', 'Core Worlds', 'Alderaan', 'Alderaan');
INSERT INTO habitats(habitatname, region, sector, sys)
             VALUES('Tatooine', 'Outer Rim Territories', 'Arkanis', 'Tatoo');
INSERT INTO habitats(habitatname, region, sector, sys)
             VALUES('Yavin 4', 'Outer Rim Territories', 'Gordian Reach', 'Yavin');
INSERT INTO habitats(habitatname, region, sector, sys)
             VALUES('Kashyyyk', 'Mytaranor', 'Kashyyyk', 'Kashyyyk');
INSERT INTO habitats(habitatname, region, sector, sys)
             VALUES('Eriadu', 'Outer Rim Territories', 'Seswanna', 'Eriadu');
INSERT INTO habitats(habitatname, region, sector, sys)
             VALUES('Naboo', 'Mid Rim', 'Chommell', 'Naboo');
INSERT INTO habitats(habitatname, region, sector, sys)
             VALUES('Geonosis', 'Outer Rim Territories', 'Arkanis', 'Geonosis');

-- Insert bases --
INSERT INTO bases(baseid, basename, habitatname)
           VALUES('b0001', 'Death Star', null);
INSERT INTO bases(baseid, basename, habitatname)
           VALUES('b0002', 'Fondor II', 'Eriadu');
INSERT INTO bases(baseid, basename, habitatname)
           VALUES('b0003', 'Tremor Base', 'Eriadu');
INSERT INTO bases(baseid, basename, habitatname)
           VALUES('b0004', 'Kashyyyk Imperial Base', 'Kashyyyk');
INSERT INTO bases(baseid, basename, habitatname)
           VALUES('b0005', 'Alpha Outpost', 'Tatooine');

-- Insert organizations --
INSERT INTO organizations(orgid, orgname)
                   VALUES('o01', 'Raider Allegiance');
INSERT INTO organizations(orgid, orgname)
                   VALUES('o02', 'Senatorial Committee');
INSERT INTO organizations(orgid, orgname)
                   VALUES('o03', 'Fleet General Academy');
INSERT INTO organizations(orgid, orgname)
                   VALUES('o04', 'Rebel Alliance');
INSERT INTO organizations(orgid, orgname)
                   VALUES('o05', 'Hutt Gang');

-- Insert beings --
INSERT INTO beings(bid, firstname, lastname, homehabitat, species, birthdate)
            VALUES('x001', 'Luke', 'Skywalker', 'Tatooine', 'Human', '1965-06-13');
INSERT INTO beings(bid, firstname, lastname, homehabitat, species, birthdate)
            VALUES('x002', 'Anakin', 'Skywalker', 'Tatooine', 'Human', '1941-02-02');
INSERT INTO beings(bid, firstname, lastname, homehabitat, species, birthdate)
            VALUES('x003', 'Chewbacca', null, 'Kashyyyk', 'Wookie', '1950-04-18');
INSERT INTO beings(bid, firstname, lastname, homehabitat, species, birthdate)
            VALUES('x004', 'Wilhuff', 'Tarkin', 'Eriadu', 'Human', '1920-10-01');
INSERT INTO beings(bid, firstname, lastname, homehabitat, species, birthdate)
            VALUES('x005', 'Leia', 'Organa', 'Alderaan', 'Human', '1965-06-13');
INSERT INTO beings(bid, firstname, lastname, homehabitat, species, birthdate)
            VALUES('x006', null, 'Palpatine', 'Naboo', 'Human', '1919-12-01');
INSERT INTO beings(bid, firstname, lastname, homehabitat, species, birthdate)
            VALUES('x007', 'Randy', 'Jacksonista', 'Alderaan', 'Human', '1938-11-04');
INSERT INTO beings(bid, firstname, lastname, homehabitat, species, birthdate)
            VALUES('x008', 'Jabba', null, 'Tatooine', 'Hutt', '1968-08-08');
INSERT INTO beings(bid, firstname, lastname, homehabitat, species, birthdate)
            VALUES('y001', null, null, 'Geonosis', 'Human', '1940-04-01');
INSERT INTO beings(bid, firstname, lastname, homehabitat, species, birthdate)
            VALUES('y002', null, null, 'Geonosis', 'Human', '1940-04-01');
INSERT INTO beings(bid, firstname, lastname, homehabitat, species, birthdate)
            VALUES('y003', null, null, 'Geonosis', 'Human', '1940-04-01');
INSERT INTO beings(bid, firstname, lastname, homehabitat, species, birthdate)
            VALUES('y004', 'Pilth', 'Phosphor', 'Alderaan', 'Human', '1938-09-01');

-- Insert allied organizations --
INSERT INTO alliedOrgs(orgid, lasttransmdate, leader)
                   VALUES('o05', '2012-10-06', 'x008');
INSERT INTO alliedOrgs(orgid, lasttransmdate, leader)
                   VALUES('o03', '2015-01-01', 'x007');

-- Insert enemy organizations --
INSERT INTO enemyOrgs(orgid, lastactivitydate, leader)
                   VALUES('o04', '2015-02-03', 'x001');
INSERT INTO enemyOrgs(orgid, lastactivitydate, leader)
                   VALUES('o02', '2013-12-21', 'x005');

-- Insert employees --
INSERT INTO employees(bid, eid, stationbaseid, salaryGCS)
               VALUES('x002', 'e001', 'b0001', 100000.00);
INSERT INTO employees(bid, eid, stationbaseid, salaryGCS)
               VALUES('x004', 'e002', 'b0001', 90000.00);
INSERT INTO employees(bid, eid, stationbaseid, salaryGCS)
               VALUES('x006', 'e003', 'b0001', 150000.00);
INSERT INTO employees(bid, eid, stationbaseid, salaryGCS)
               VALUES('y001', 'e004', 'b0004', 5000.00);
INSERT INTO employees(bid, eid, stationbaseid, salaryGCS)
               VALUES('y002', 'e005', 'b0004', 5000.00);
INSERT INTO employees(bid, eid, stationbaseid, salaryGCS)
               VALUES('y003', 'e006', 'b0005', 5000.00);
INSERT INTO employees(bid, eid, stationbaseid, salaryGCS)
               VALUES('y004', 'e007', 'b0002', 10000.00);

-- Insert administrators --
INSERT INTO administrators(adminid, baseassignment)
                    VALUES('e001', 'b0001');
INSERT INTO administrators(adminid, baseassignment)
                    VALUES('e002', 'b0003');

-- Insert soldiers --
INSERT INTO soldiers(soldid, isclone, battlesfought)
              VALUES('e004', true, 30);
INSERT INTO soldiers(soldid, isclone, battlesfought)
              VALUES('e005', true, 15);
INSERT INTO soldiers(soldid, isclone, battlesfought)
              VALUES('e006', true, 24);
INSERT INTO soldiers(soldid, isclone, battlesfought)
              VALUES('e007', false, 8);

-- Insert jedi --
INSERT INTO jedi(bid, sabercolor)
          VALUES('x001', 'green');

-- Insert sith --
INSERT INTO sith(bid, sabercolor)
          VALUES('x002', 'red');
INSERT INTO sith(bid, sabercolor)
          VALUES('x006', 'red');

-- Views --
-----------

-- Soldier id and number of battles fought for clone soldiers
CREATE VIEW cloneSoldiers(soldid, battlesfought) AS
  select s.soldid,
         s.battlesfought
    from soldiers s
   where s.isclone = true;

-- Beings who are not imperial employees
CREATE VIEW nonEmployees(bid, lastname, firstname, homehabitat, birthdate) AS
  select b.bid,
         b.lastname,
         b.firstname,
         b.homehabitat,
         b.birthdate
    from beings b
   where b.bid not in (select e.bid
                         from employees e);

-- Beings who are human
CREATE VIEW humanBeings(bid, lastname, firstname, homehabitat, birthdate) AS
  select b.bid,
         b.lastname,
         b.firstname,
         b.homehabitat,
         b.birthdate
    from beings b
   where b.species = 'Human';

-- Organizations who are not allied with or enemies to the Empire
CREATE VIEW neutralOrgs(orgid, orgname) AS
  select o.orgid,
         o.orgname
    from organizations o
   where o.orgid not in (select ao.orgid
                           from alliedOrgs ao)
     and o.orgid not in (select en.orgid
                           from enemyOrgs en);

-- Reports --
-------------

-- All info about employees with a salary of at least
-- 100,000.00 Galactic Standard Credits
select *
  from employees e
 where e.salaryGCS >= 100000.00;

-- All beings whose home habitat is Tatooine
select *
  from beings b
 where b.homehabitat = 'Tatooine';

-- The administrator ids of, and names of, all bases
-- that do not have a habitat
select a.adminid,
       b.basename
  from bases b
       left outer join
       administrators a
    on b.baseid = a.baseassignment
 where b.habitatname is null;

-- All non-employees who are from the same planet as a sith
select b.bid,
       b.lastname,
       b.firstname
  from beings b,
       nonEmployees ne
 where b.bid = ne.bid
   and b.homehabitat in (select b2.homehabitat
                           from beings b2,
                                sith s
                          where b2.bid = s.bid);

-- Stored Procedures --
-----------------------

-- Returns all beings whose home habitat is given as a parameter
CREATE OR REPLACE FUNCTION AllBeingsFromHabitat(text, refcursor) RETURNS refcursor AS
$$
DECLARE
  searchHabitat text      := $1;
  results       refcursor := $2;
BEGIN
  OPEN results FOR
    select *
      from beings b
     where b.homehabitat = searchHabitat;
  RETURN results;
END;
$$ LANGUAGE plpgsql;

select AllBeingsFromHabitat('Alderaan', 'results');
fetch all from results;

-- Returns all employees whose birthdate comes before the given date
CREATE OR REPLACE FUNCTION EmployeesOlderThan(date, refcursor) RETURNS refcursor AS
$$
DECLARE
  searchDate date      := $1;
  results    refcursor := $2;
BEGIN
  OPEN results FOR
    select e.eid
      from beings b,
           employees e
     where b.bid = e.bid
       and b.birthdate < searchDate;
  RETURN results;
END;
$$ LANGUAGE plpgsql;

select EmployeesOlderThan('1940-01-01', 'results');
fetch all from results;

-- Triggers --
--------------

CREATE OR REPLACE FUNCTION incrSalary() RETURNS trigger AS
$$
BEGIN
  IF (NEW.isclone = false) THEN
    IF (NEW.battlesfought > 49) THEN
      UPDATE employees
         SET salaryGCS = salaryGCS + 3000.00
       WHERE employees.eid = NEW.soldid;
    END IF;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER incrNonCloneSalaryOn50Battles
AFTER UPDATE ON soldiers FOR EACH ROW EXECUTE PROCEDURE incrSalary();

-- Security --
--------------

-- Database administrator --
CREATE ROLE dbadmin;
GRANT ALL ON ALL TABLES IN SCHEMA PUBLIC
TO dbadmin;

-- Soldiers --
CREATE ROLE soldiers;
GRANT SELECT ON habitats, bases, soldiers, jedi, sith
TO soldiers;

-- Imperial administrators, to distinguish from the DB admin --
CREATE ROLE impadmin;
GRANT SELECT ON ALL TABLES IN SCHEMA PUBLIC
TO impadmin;
GRANT INSERT, UPDATE ON soldiers, employees, jedi, sith, bases,
                        habitats, organizations, alliedOrgs, enemyOrgs
TO impadmin;
