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
DROP TABLE IF EXISTS basesOnPlanets;
DROP TABLE IF EXISTS bases;
DROP TABLE IF EXISTS beings;
DROP TABLE IF EXISTS planets;

-- Create Statements --
-----------------------

-- Planets --
CREATE TABLE planets (
  planetname text not null,
  region     text,
  sector     text,
  system     text,
  primary key(planetname)
);

-- Living Beings (equivalent to people, but more inclusive) --
CREATE TABLE beings (
  bid        char(4),
  lastname   text,
  firstname  text,
  homeplanet text references planets(planetname),
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
  baseid       char(5) not null,
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
  focusplanet text    references planets(planetname),
  primary key(spyid)
);

-- A cross reference for which bases are on which planets --
CREATE TABLE basesOnPlanets (
  baseid     char(5) not null references bases(baseid),
  planetname text    not null references planets(planetname),
  primary key(baseid, planetname)
);

-- Established organizations all across the galaxy --
CREATE TABLE organizations (
  orgid   char(3),
  orgname text,
  primary key(orgid)
);

-- Organizations that are allied with the Empire --
CREATE TABLE alliedOrgs (
  orgid            char(3) references organizations(orgid),
  lastactivitydate date,
  primary key(orgid)
);

-- Organizations that are enemies to the Empire --
CREATE TABLE enemyOrgs (
  orgid          char(3) references organizations(orgid),
  lasttransmdate date,
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
