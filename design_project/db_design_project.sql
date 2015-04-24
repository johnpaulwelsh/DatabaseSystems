-- John Paul Welsh
-- Galactic Empire Design Project

CREATE TABLE planets (
  planetname text not null,
  region     text,
  sector     text,
  system     text,
  primary key(planetname)
);

CREATE TABLE bases (
  baseid       char(5) not null,
  supervisorid char(4) references beings(bid),
  primary key(basid)
);

CREATE TABLE basesOnPlanets (
  baseid     char(5) not null references bases(baseid),
  planetname text    not null references planets(planetname),
  primary key(baseid, planetname)
);

CREATE TABLE beings (
  bid        char(4),
  lastname   text,
  firstname  text,
  homeplanet text ref planets(planetname),
  species    text,
  birthdate  date,
  primary key(bid)
);

CREATE TABLE jedi (
  bid        char(4) references beings(bid),
  sabercolor text, -- MAKE THIS A RESTRICTED DOMAIN
  rank       text, -- THIS TOO
  primary key(bid)
);

CREATE TABLE sith (
  bid        char(4) references beings(bid),
  sabercolor text, -- MAKE THIS A RESTRICTED DOMAIN
  rank       text, -- THIS TOO
  primary key(bid)
);

CREATE TABLE employees (
  bid           char(4) references beings(bid),
  eid           char(4),
  stationbaseid char(5) references bases(baseid),
  salaryGCS     numeric(10,2),
  primary key(eid)
);

CREATE TABLE administrators (
  eid char(4) references employees(eid),
  primary key(bid)
);

CREATE TABLE soldiers (
  eid     char(4) references employees(eid),
  isclone boolean,
  primary key(bid)
);

CREATE TABLE spies (
  eid         char(4) references employees(eid),
  focusplanet text references planets(planetname),
  primary key(bid)
);

CREATE TABLE organizations (
  orgid   char(3),
  orgname text,
  primary key(orgid)
);

CREATE TABLE alliedOrgs (
  orgid            char(3) references organizations(orgid),
  lastactivitydate date,
  primary key(orgid)
);

CREATE TABLE enemyOrgs (
  orgid          char(3) references organizations(orgid),
  lasttransmdate date,
  primary key(orgid)
);

CREATE TABLE alliedLeaders (
  bid   char(4) references beings(bid),
  orgid char(3) references organizations(orgid),
  primary key(bid,orgid)
);

CREATE TABLE enemyLeaders (
  bid   char(4) references beings(bid),
  orgid char(3) references organizations(orgid),
  primary key(bid,orgid)
);
