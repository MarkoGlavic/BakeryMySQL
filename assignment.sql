DROP TABLE IF EXISTS food_ingredients;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS purchase_products;
DROP TABLE IF EXISTS customer_purchases;
DROP TABLE IF EXISTS customers;
CREATE TABLE customers
(customer_ID INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(30) NOT NULL,
customer_phone INT NOT 	NULL,
customer_email VARCHAR(30));

DROP TABLE IF EXISTS payments;
CREATE TABLE payments
(payment_ID INT PRIMARY KEY AUTO_INCREMENT,
payment_total INT NOT NULL,
payment_date DATE NOT NULL,
payment_type ENUM("cash", "credit") NOT NULL,
payment_info VARCHAR(50));

DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
employee_ID INT PRIMARY KEY AUTO_INCREMENT,
employee_name VARCHAR(30) NOT NULL,
employee_contactnum INT NOT NULL,
employee_type VARCHAR(20) NOT NULL,
employee_salary INT NOT NULL,
employee_hours INT NOT NULL,
employee_shift VARCHAR(20) NOT NULL,
employee_email VARCHAR(30));




CREATE TABLE customer_purchases
(purchase_ID INT PRIMARY KEY AUTO_INCREMENT,
purchase_time VARCHAR (5) NOT NULL,
purchase_info VARCHAR(50),
customer_num INT, 
payment_num INT,
employee_num INT,
FOREIGN KEY fk_customer(customer_num) REFERENCES customers(customer_ID),
FOREIGN KEY fk_payment(payment_num) REFERENCES payments(payment_ID),
FOREIGN KEY fk_employee(employee_num) REFERENCES employees(employee_ID)
ON UPDATE CASCADE
ON DELETE SET NULL);


DROP TABLE IF EXISTS drinks;
CREATE TABLE drinks
(product_ID INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR (20) NOT NULL,
product_price DECIMAL (4,2) NOT NULL,
drink_expiry DATE NOT NULL
);

DROP TABLE IF EXISTS food;
CREATE TABLE food
(product_ID INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR (20) NOT NULL,
product_price DECIMAL (4,2) NOT NULL,
food_time VARCHAR(5) NOT NULL
);



CREATE TABLE purchase_products
(purchase_ID INT PRIMARY KEY AUTO_INCREMENT,
purchase_quantity INT NOT NULL,
purchase_num INT,
drink_num INT,
food_num INT,
FOREIGN KEY fk_purchase(purchase_num) REFERENCES customer_purchases(purchase_ID),
FOREIGN KEY fk_drink(drink_num) REFERENCES drinks(product_ID),
FOREIGN KEY fk_food(food_num) REFERENCES food(product_ID)
ON UPDATE CASCADE
ON DELETE SET NULL);

CREATE TABLE suppliers
(supplier_ID VARCHAR(30) PRIMARY KEY,
supplier_phone INT NOT NULL,
supplier_email VARCHAR(30) NOT NULL
);

CREATE TABLE ingredients
(ingredient_ID INT PRIMARY KEY AUTO_INCREMENT,
ingredient_name VARCHAR(20) NOT NULL,
ingredient_date DATE NOT NULL,
supplier_name VARCHAR(30),
FOREIGN KEY fk_supplier(supplier_name) REFERENCES suppliers(supplier_ID));


CREATE TABLE food_ingredients
(ingredient_ID INT PRIMARY KEY AUTO_INCREMENT,
ingredient_quantity INT NOT NULL,
food_num INT,
ingredient_num INT,
FOREIGN KEY fk_food(food_num) REFERENCES food(product_ID),
FOREIGN KEY fk_ingredient(ingredient_num) REFERENCES ingredients(ingredient_ID)
ON UPDATE CASCADE
ON DELETE SET NULL);


INSERT INTO customers
VALUES (DEFAULT, "Marko Glavic", "00059127831", "lel@gmail.com");
INSERT INTO customers
VALUES (DEFAULT, "Mirjana Glavic", "123", "asdf@hotmail.com");
INSERT INTO customers
VALUES (DEFAULT, "Ivica Glavic", "123", "asdf@hotmail.com");
INSERT INTO customers
VALUES (DEFAULT, "Random Random", "123432423", "asdf@outlook.com");
INSERT INTO customers
VALUES (DEFAULT, "Brad Pitt", "4327683", "brad@hotmail.com");
INSERT INTO customers
VALUES (DEFAULT, "Elon Musk", "77777777", NULL);

INSERT INTO payments
VALUES(DEFAULT,"120","2021-12-04","cash",NULL);
INSERT INTO payments
VALUES(DEFAULT,"100","2021-12-02","cash",NULL);
INSERT INTO payments
VALUES(DEFAULT,"15","2021-12-01","cash",NULL);
INSERT INTO payments
VALUES(DEFAULT,"5","2021-12-04","cash",NULL);
INSERT INTO payments
VALUES(DEFAULT,"200","2021-12-03","credit",NULL);
INSERT INTO payments
VALUES(DEFAULT,"201","2021-12-03","credit",NULL);

INSERT INTO employees
VALUES(DEFAULT,"Bill Nye","38726349","manager","2000","56","Day", NULL);
INSERT INTO employees
VALUES(DEFAULT,"Joel","4325131","baker","1500","56","Day", NULL);
INSERT INTO employees
VALUES(DEFAULT,"Liam","3215","baker","1500","40","Night", NULL);
INSERT INTO employees
VALUES(DEFAULT,"Ana","3873215","baker","1500","56","Day", NULL);
INSERT INTO employees
VALUES(DEFAULT,"Tom","393272","cashier","2000","28","Day", NULL);
INSERT INTO employees
VALUES(DEFAULT,"Susan","5555","cashier","2000","56","Day", NULL);

INSERT INTO customer_purchases
VALUES(DEFAULT,"19:00",NULL,"1","3","6"); 
INSERT INTO customer_purchases
VALUES(DEFAULT,"19:30",NULL,"2","6","5"); 
INSERT INTO customer_purchases
VALUES(DEFAULT,"19:40",NULL,"3","4","5");
INSERT INTO customer_purchases
VALUES(DEFAULT,"19:00",NULL,"1","3","6"); 
INSERT INTO customer_purchases
VALUES(DEFAULT,"10:00",NULL,"4","1","6");
INSERT INTO customer_purchases
VALUES(DEFAULT,"11:00",NULL,"5","2","6");
INSERT INTO customer_purchases
VALUES(DEFAULT,"12:00",NULL,"6","5","5"); 
INSERT INTO customer_purchases
VALUES(DEFAULT,"13:00",NULL,"6","3","6"); 


INSERT INTO drinks
VALUES(DEFAULT,"Coca Cola","2.1","2021-12-13");
INSERT INTO drinks
VALUES(DEFAULT,"Sprite", "2","2021-12-12");
INSERT INTO drinks
VALUES(DEFAULT,"Fanta", "1.9","2021-12-12");
INSERT INTO drinks
VALUES(DEFAULT,"Water", "1","2021-12-12");
INSERT INTO drinks
VALUES(DEFAULT,"Milk", "1","2021-12-13");
INSERT INTO drinks
VALUES(DEFAULT,"Chocolate Milk", "2","2021-12-14");

INSERT INTO food
VALUES(DEFAULT,"Bagel", "1.52", "8:00");
INSERT INTO food
VALUES(DEFAULT,"Bread", "1", "8:00");
INSERT INTO food
VALUES(DEFAULT,"Cake", "20", "8:00");
INSERT INTO food
VALUES(DEFAULT,"Pizza", "3", "13:00");
INSERT INTO food
VALUES(DEFAULT,"Hot Dog", "5", "13:00");
INSERT INTO food
VALUES(DEFAULT,"Croissant", "1.52", "13:00");

INSERT INTO purchase_products
VALUES(DEFAULT,"5","6",NULL,"3");
INSERT INTO purchase_products
VALUES(DEFAULT,"3","3","2","2");
INSERT INTO purchase_products
VALUES(DEFAULT,"6","1","6","5");
INSERT INTO purchase_products
VALUES(DEFAULT,"1","2","4","3");
INSERT INTO purchase_products
VALUES(DEFAULT,"3","4",NULL,"5");
INSERT INTO purchase_products
VALUES(DEFAULT,"120","5","4",NULL);
INSERT INTO purchase_products
VALUES(DEFAULT,"10","7",NULL,"3");
INSERT INTO purchase_products
VALUES(DEFAULT,"7","8","4","4");

INSERT INTO suppliers
VALUES("MarkoINC","3211","afds@gmail.com");
INSERT INTO suppliers
VALUES("AA","3211","afds@gmail.com");
INSERT INTO suppliers
VALUES("BB","3211","afds@gmail.com");


INSERT INTO ingredients
VALUES(DEFAULT,"Tomato","2021-12-10","MarkoINC");
INSERT INTO ingredients
VALUES(DEFAULT,"Flour","2021-12-10","MarkoINC");
INSERT INTO ingredients
VALUES(DEFAULT,"Sugar","2021-12-10","AA");
INSERT INTO ingredients
VALUES(DEFAULT,"Salt","2021-12-10","AA");
INSERT INTO ingredients
VALUES(DEFAULT,"Oil","2021-12-10","BB");
INSERT INTO ingredients
VALUES(DEFAULT,"Cheese","2021-12-10","BB");

INSERT INTO food_ingredients
VALUES(DEFAULT,1,4,1);
INSERT INTO food_ingredients
VALUES(DEFAULT,10,4,6);
INSERT INTO food_ingredients
VALUES(DEFAULT,20,4,2);







