DROP TABLE transactions;
DROP TABLE items;
DROP TABLE stores;

CREATE TABLE categories (
  id serial4 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE merchants (
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  id serial4 PRIMARY KEY,
  category_id int4 REFERENCES categories(id) ON DELETE CASCADE,
  merchant_id int4 REFERENCES merchants(id) ON DELETE CASCADE,
  cost DECIMAL(6,2)
);