-- John Paul Welsh
-- Galactic Empire Design Project

-- Table Drops --
-----------------
DROP TABLE IF EXISTS alliedLeaders;
DROP TABLE IF EXISTS enemyLeaders;
DROP TABLE IF EXISTS alliedOrgs;
DROP TABLE IF EXISTS enemyOrgs;
DROP TABLE IF EXISTS organizations;
DROP TABLE IF EXISTS jedi;
DROP TABLE IF EXISTS sith;
DROP TABLE IF EXISTS soldiers;
DROP TABLE IF EXISTS spies;
DROP TABLE IF EXISTS administrators;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS bases;
DROP TABLE IF EXISTS beings;
DROP TABLE IF EXISTS habitats;

-- Create Statements --
-----------------------

-- Habitats (equivalent to planets, but inclusive of moons) --
CREATE TABLE habitats (
  habitatname text not null,
  region     text,
  sector     text,
  sys        text,
  primary key(habitatname)
);

-- Living Beings (equivalent to people, but more inclusive) --
CREATE TABLE beings (
  bid        char(4),
  lastname   text,
  firstname  text,
  homehabitat text references habitats(habitatname),
  species    text,
  birthdate  date,
  primary key(bid)
);

-- Jedi knights --
CREATE TABLE jedi (
  bid        char(4) references beings(bid),
  sabercolor text, -- MAKE THIS A RESTRICTED DOMAIN
  rank       text, -- THIS TOO
  primary key(bid)
);

-- Sith lords --
CREATE TABLE sith (
  bid        char(4) references beings(bid),
  sabercolor text, -- MAKE THIS A RESTRICTED DOMAIN
  rank       text, -- THIS TOO
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
  bid           char(4) references beings(bid),
  eid           char(4),
  stationbaseid char(5) references bases(baseid),
  salaryGCS     numeric(10,2),
  primary key(eid)
);

-- Administrative employees --
CREATE TABLE administrators (
  adminid        char(4) references employees(eid),
  baseassignment char(4) references bases(baseid),
  primary key(adminid)
);

-- Empire soldiers --
CREATE TABLE soldiers (
  soldid  char(4) references employees(eid),
  isclone boolean,
  primary key(soldid)
);

-- Spies for the Empire --
CREATE TABLE spies (
  spyid       char(4) references employees(eid),
  focushabitat text    references habitats(habitatname),
  primary key(spyid)
);

-- Established organizations all across the galaxy --
CREATE TABLE organizations (
  orgid   char(3),
  orgname text,
  primary key(orgid)
);

-- Organizations that are allied with the Empire --
CREATE TABLE alliedOrgs (
  orgid          char(3) references organizations(orgid),
  lasttransmdate date,
  primary key(orgid)
);

-- Organizations that are enemies to the Empire --
CREATE TABLE enemyOrgs (
  orgid            char(3) references organizations(orgid),
  lastactivitydate date,
  primary key(orgid)
);

-- Leaders of allied organizations --
CREATE TABLE alliedLeaders (
  bid   char(4) references beings(bid),
  orgid char(3) references organizations(orgid),
  primary key(bid,orgid)
);

-- Leaders of enemy organizations --
CREATE TABLE enemyLeaders (
  bid   char(4) references beings(bid),
  orgid char(3) references organizations(orgid),
  primary key(bid,orgid)
);

-- Sample Data --
-----------------
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

INSERT INTO bases(baseid, basename, habitatname)
           VALUES('b0001', 'Death Star', null);
INSERT INTO bases(baseid)
           VALUES('b0002', 'Fondor II', 'Eriadu');
INSERT INTO bases(baseid)
           VALUES('b0003', 'Tremor Base', 'Eriadu');
INSERT INTO bases(baseid)
           VALUES('b0004', 'Kashyyyk Imperial Base', 'Kashyyyk');
INSERT INTO bases(baseid)
           VALUES('b0005', 'Alpha Outpost', 'Tatooine');

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

INSERT INTO alliedOrgs(orgid, lasttransmdate)
                   VALUES('o05', '2012-10-06');
INSERT INTO alliedOrgs(orgid, lasttransmdate)
                   VALUES('o03', '2015-01-01');

INSERT INTO enemyOrgs(orgid, lastactivitydate)
                   VALUES('o04', '2015-02-03');
INSERT INTO enemyOrgs(orgid, lastactivitydate)
                   VALUES('o02', '2013-12-21');

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



-- Views --
-----------

-- Reports --
-------------

-- Stored Procedures --
-----------------------

-- Triggers --
--------------

-- Security --
--------------
