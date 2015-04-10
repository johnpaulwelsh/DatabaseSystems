DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS supplierlocations;
DROP TABLE IF EXISTS merchandise;
DROP TABLE IF EXISTS merchorders;
DROP TABLE IF EXISTS itemlists;

-- Suppliers --
CREATE TABLE suppliers (
  sid         char(4) not null,
  name        text,
  zip         integer,
  payterms    text,
  contactinfo text,
 primary key(sid)
);

-- Supplier Location Information --
CREATE TABLE supplierlocations (
  sid         char(4) not null references suppliers(sid),
  zip         integer not null references suppliers(zip),
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

-- Orders -- 
CREATE TABLE merchorders (
  ordno     char(4) not null,
  sid       char(4) references suppliers(sid),
  listno    char(4) references itemlists(listno),
  comments  text,
  orderdate date,
  primary key(ordno)
);

-- Lists of Items in Each Order --
CREATE TABLE itemlists (
  listno char(4) not null,
  sku    char(4) not null references merchandise(sku),
  quantity integer,
  price numeric(10,2),
  primary key(listno,sku)
);

