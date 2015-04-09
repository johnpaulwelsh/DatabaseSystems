-- Suppliers --
CREATE TABLE suppliers (
  sid         char(4) not null,
  name        text,
  zip         integer,
  payterms    text,
  contactinfo text,
 primary key(sid)
);

-- Addresses --
CREATE TABLE addresses (
  sid         char(4) not null references suppliers(sid),
  zip         integer not null references suppliers(zip),
  address     text,
  city        text,
  state       char(2),
  primary key(sid,zip)
);

-- Merchandise --
CREATE TABLE merchandise (
  sku         char(4) not null,
  description text,
  priceUSD    numeric(10,2),
  quantity    integer,
 primary key(sku)
);

CREATE TABLE skulists (
  skulistno char(4) not null,
  sku       char(4) not null references merchandise(sku),
  ordno     char(4),
  quantity  integer,
  primary key(skulistno,sku)
);

-- Orders -- 
CREATE TABLE orders (
  ordno     char(4) not null,
  sid       char(4) not null references suppliers(sid),
  skulistno char(4) not null references skulists(skulistno),
  orddate   date,
  comments  text,
  primary key(ordno)
);

