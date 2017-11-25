CREATE database if NOT EXISTS Sales;
USE Sales;

CREATE TABLE sales (
    purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (purchase_number)
);

CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY (customer_id)
);

CREATE TABLE items (
    item_id VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10 , 2 ),
    company_id VARCHAR(255),
    PRIMARY KEY (item_id)
);

CREATE TABLE companies (
    company_id VARCHAR(255) DEFAULT 'X',
    company_name VARCHAR(255),
    headquarters_phone_number INT(12) NOT NULL,
    PRIMARY KEY (company_id),
    UNIQUE KEY (headquarters_phone_number)
);

ALTER table sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) on delete cascade;
/*
#Unique keys

ALTER TABLE items
ADD FOREIGN KEY (company_id) REFERENCES companies(company_id) on delete cascade;

*/

#Adds an enumerated column
ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

#insert into
INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

#Setting default values
ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

INSERT INTO customers (first_name,last_name,gender)
VALUES ('Peter','Figaro','M');

SELECT * FROM customers;

ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT;
#SELECT * FROM sales;
#SELECT * FROM sales.sales;
#DROP DATABASE sales;
#truncate table sales;
#DROP TABLE sales;
#DROP TABLE customers;
#DROP TABLE items;
#DROP TABLE companies;