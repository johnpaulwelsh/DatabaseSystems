-- John Paul Welsh
-- Lab 8

DROP TABLE IF EXISTS merchorders;
DROP TABLE IF EXISTS itemsinlists;
DROP TABLE IF EXISTS supplierlocations;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS zipcodes;
DROP TABLE IF EXISTS merchandise;

-- Zip Codes --
CREATE TABLE zipcodes (
  zip integer,
  primary key(zip)
);

-- Suppliers --
CREATE TABLE suppliers (
  sid         char(4) not null,
  name        text,
  zip         integer not null references zipcodes(zip),
  payterms    text,
  contactinfo text,
  primary key(sid)
);

-- Supplier Location Information --
CREATE TABLE supplierlocations (
  sid         char(4) not null references suppliers(sid),
  zip         integer not null references zipcodes(zip),
  address     text,
  city        text,
  state       char(2),
  primary key(sid,zip)
);

-- Clothing Items --
CREATE TABLE merchandise (
  sku         char(4) not null,
  description text,
  quantity    integer,
  priceUSD    numeric(10,2),
 primary key(sku)
);

CREATE TABLE ordereditems (
  itemid char(3) not null,
  sku      char(4) not null references merchandise(sku),
  quantity integer,
  price    numeric(10,2),
  primary key(itemid)
);

-- Lists of Items in Each Order --
CREATE TABLE itemsinlists (
  listno char(4) not null,
  itemid char(3) references ordereditems(itemid),
  primary key(listno)
);

-- Orders -- 
CREATE TABLE merchorders (
  ordno     char(4) not null,
  sid       char(4) references suppliers(sid),
  listno    char(4) references itemsinlists(listno),
  comments  text,
  orderdate date,
  primary key(ordno)
);
