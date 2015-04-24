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

CREATE TABLE employees (
  bid           char(4) references beings(bid),
  stationbaseid char(5) references bases(baseid),
  salaryGCS     numeric(10,2),
  primary key(bid)
);

CREATE TABLE engineers (
  bid           char(4) references beings(bid),
  primary key(bid)
);

CREATE TABLE administrators (
  bid           char(4) references beings(bid),
  primary key(bid)
);

CREATE TABLE mechanics (
  bid           char(4) references beings(bid),
  isrighthanded boolean,
  primary key(bid)
);

CREATE TABLE soldiers (
  bid     char(4) references beings(bid),
  isclone boolean,
  primary key(bid)
);

CREATE TABLE jedi (
  bid        char(4) references beings(bid),
  sabercolor text, -- MAKE THIS A RESTRICTED DOMAIN
  rank       text, -- THIS TOO
  primary key(bid)
);

CREATE TABLE spies (
  bid         char(4) references beings(bid),
  focusplanet text references planets(planetname),
  specialty   text,
  primary key(bid)
);
