CREATE DATABASE warehouses;
USE warehouses;

DROP TABLE IF EXISTS provider;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS customer;

CREATE TABLE IF NOT EXISTS warehouse
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(50) NOT NULL,
    address  VARCHAR(50) NOT NULL,
    zip_code VARCHAR(6)
);

INSERT INTO warehouse(id, name, address, zip_code)
VALUES (1, 'My first warehouse', 'Some address', '44555');

CREATE TABLE IF NOT EXISTS provider
(
    providers_id INT PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(25)  NOT NULL,
    phone        VARCHAR(25)  NOT NULL,
    product_name VARCHAR(200) NOT NULL,
    price        DOUBLE       NOT NULL,
    warehouse_id INT          NOT NULL,
    CONSTRAINT provider_id_warehouse_id_fk FOREIGN KEY (warehouse_id)
        REFERENCES warehouse (id)
);

INSERT INTO provider
    (name, phone, product_name, price, warehouse_id)
VALUES ('APPLE', '0202234564', 'Apple', 5.30, 1),
       ('APPLE', '0202234564', 'AppleS', 5.40, 1),
       ('CAT', '0000000012', 'Royal Canin Sterilised', 13.1, 1),
       ('CAT', '0000000012', 'Royal Canin British Shorthair', 34.1, 1),
       ('CAT', '0000000012', 'Optimeal Cat Adult Sterilised Turkey', 23.1, 1),
       ('CAT', '0000000012', 'Royal Canin Kitten', 23.4, 1);
CREATE TABLE IF NOT EXISTS employee
(
    employee_id  INT PRIMARY KEY AUTO_INCREMENT,
    fName        VARCHAR(30) NOT NULL,
    lName        VARCHAR(40) NOT NULL,
    phone        VARCHAR(10) NOT NULL,
    position     VARCHAR(40) NOT NULL,
    salary       DECIMAL(10) NOT NULL,
    warehouse_id INT         NOT NULL,
    CONSTRAINT employee_id_warehouse_id_fk FOREIGN KEY (warehouse_id)
        REFERENCES warehouse (id)
);

INSERT INTO employee
    (fName, lName, phone, position, salary, warehouse_id)
VALUES ('Nadia', 'Filatova', '0962324124', 'Manager', 1600, 1),
       ('Nata', 'Nana', '0983325222', 'Manager', 1695, 1),
       ('Anastasia', 'Kosheluk', '0982184134', 'Director', 11000, 1),
       ('John', 'Fits', '0972994153', 'Administrator', 1500, 1);

CREATE TABLE IF NOT EXISTS customer
(
    customers_id  INT PRIMARY KEY AUTO_INCREMENT,
    name          VARCHAR(50) NOT NULL,
    phone         VARCHAR(10) NOT NULL,
    address       VARCHAR(40) NOT NULL,
    ordered_goods INT         NOT NULL,
    warehouse_id  INT         NOT NULL,
    CONSTRAINT customer_id_warehouse_id_fk FOREIGN KEY (warehouse_id)
        REFERENCES warehouse (id)
);

INSERT INTO customer
    (name, phone, address, ordered_goods, warehouse_id)
VALUES ('SevernEleven', '3434567890', 'Lviv, Bandera st.12', 1, 1),
       ('ATB', '3214512390', 'Luck, Bandera st.22', 2, 1),
       ('Silpo', '3214447890', 'Odessa, Primorska st.23/6', 4, 1),
       ('ATB', '3214512390', 'Luck, Saint Bereza st.22', 3, 1);

SELECT *
FROM provider;
SELECT *
FROM employee;
SELECT *
FROM customer;