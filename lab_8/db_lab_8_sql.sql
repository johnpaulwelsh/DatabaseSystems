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
CREATE TABLE supplierLocations (
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
CREATE TABLE orders (
  
);

-- Lists of Items in Each Order --
CREATE TABLE itemlists (

);

