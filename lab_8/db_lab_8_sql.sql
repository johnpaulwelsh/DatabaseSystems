-- John Paul Welsh
-- Lab 8

DROP TABLE IF EXISTS merchorders;
DROP TABLE IF EXISTS itemsinlists;
DROP TABLE IF EXISTS supplierlocations;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS ordereditems;
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

-- Items that have been Ordered --
CREATE TABLE ordereditems (
  itemid   char(3) not null,
  sku      char(4) not null references merchandise(sku),
  quantity integer,
  priceUSD numeric(10,2),
  primary key(itemid)
);

-- Lists of Items in each Order --
CREATE TABLE itemsinlists (
  listno char(3) not null,
  itemid char(3) references ordereditems(itemid),
  primary key(listno)
);

-- Orders -- 
CREATE TABLE merchorders (
  ordno     char(4) not null,
  sid       char(4) references suppliers(sid),
  listno    char(3) references itemsinlists(listno),
  comments  text,
  orderdate date,
  primary key(ordno)
);

-- Entering Sample Data --
INSERT INTO zipcodes(zip)
              VALUES(12601);
INSERT INTO zipcodes(zip)
              VALUES(08260);

INSERT INTO suppliers(sid, name, zip, payterms, contactinfo)
               VALUES('s001', 'Skywalker', 12601, 'Credits please', 'The force');
INSERT INTO suppliers(sid, name, zip, payterms, contactinfo)
               VALUES('s002', 'Kenobi', 08260, 'Yoda will take the payment', 'The force');
INSERT INTO suppliers(sid, name, zip, payterms, contactinfo)
               VALUES('s003', 'Solo', 12601, 'Never tell me the odds', 'Phone call');

INSERT INTO supplierlocations(sid, zip, address, city, state)
               VALUES('s001', 12601, '123 Dingle Street', 'Poughkeepsie', 'NY');
INSERT INTO supplierlocations(sid, zip, address, city, state)
               VALUES('s002', 08260, '456 Dramble Road', 'Wildwood', 'NJ');
INSERT INTO supplierlocations(sid, zip, address, city, state)
               VALUES('s003', 12601, '789 Bramble Boulevard', 'Poughkeepsie', 'NY');

INSERT INTO merchandise(sku, description, quantity, priceUSD)
                 VALUES('k001', 'Blaster', 400, 32.00);
INSERT INTO merchandise(sku, description, quantity, priceUSD)
                 VALUES('k002', 'Lightsaber', 60, 999.00);

INSERT INTO ordereditems(itemid, sku, quantity, priceUSD)
                  VALUES('aaa', 'k002', 19, 18981.00);
INSERT INTO ordereditems(itemid, sku, quantity, priceUSD)
                  VALUES('aab', 'k001', 200, 6400.00);

INSERT INTO itemsinlists(listno, itemid)
                  VALUES('100', 'aaa');
INSERT INTO itemsinlists(listno, itemid)
                  VALUES('101', 'aab');

INSERT INTO merchorders(ordno, sid, listno, comments, orderdate)
                 VALUES('o001', 's001', '100', 'Do not drop', now()::date);

-- Query --
-- Calculate how many of a given SKU are available to
-- be sold. The amount available to be sold is defined
-- as the amount currently on hand plus the amount on
-- order. (You can hard-code the SKU into the query.)
select mh.sku,
       (mh.quantity + oi.quantity) as "amtavailtobesold"
  from merchorders  mo,
       itemsinlists il,
       ordereditems oi,
       merchandise  mh
 where mo.listno = il.listno
   and il.itemid = 'aaa'
   and oi.itemid = il.itemid
   and oi.sku = mh.sku
