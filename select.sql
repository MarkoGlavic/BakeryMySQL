
/* Baker - Shows what ingredients are needed to make a product*/
SELECT t1.ingredient_quantity AS "Total ingredients",
	   t2.ingredient_name AS "Ingredient name",
       t3.product_name AS "Food name"
       FROM food_ingredients as t1
       INNER JOIN ingredients t2 USING(ingredient_ID)
       INNER JOIN food t3 ON t1.food_num = t3.product_ID
       WHERE product_name = "Pizza";


/* Manager - Lists all purchases including : total quantity,price of each product and total price*/

SELECT t1.purchase_quantity AS "Total items",
	   t2.product_name AS "Food",
       t2.product_price AS "Food price",
       t3.product_name AS "Drink",
       t3.product_price AS "Drink price",
       t5.payment_total AS "Total price"
       FROM purchase_products AS t1
       LEFT JOIN food t2 ON t1.food_num = t2.product_ID 
       LEFT JOIN drinks t3 ON t1.drink_num = t3.product_ID 
	   INNER JOIN customer_purchases t4 ON t1.purchase_num = t4.purchase_ID
	   INNER JOIN payments t5 ON t4.payment_num = t5.payment_ID;


/* Manager - Shows all purchases of a customer, in this case it shows only purchases above $100*/
SELECT t1.customer_name AS "Name",
       t3.payment_total AS "Price",
       t3.payment_date  AS "Date",
       t4.employee_name AS "Seller"
       FROM customers AS t1
       INNER JOIN customer_purchases t2 ON t1.customer_ID = t2.customer_num
       INNER JOIN payments t3 ON t2.payment_num = t3.payment_ID 
       INNER JOIN employees t4 on t2.employee_num = t4.employee_ID
       WHERE t1.customer_name = "Elon Musk" AND payment_total >= "100";
       
/* Manager - Shows the max purchase of a specified date*/       
SELECT MAX(payment_total)
AS "Largest purchase"
FROM payments
WHERE payment_date ="2021-12-04";

/* Manager - Shows total amout of money earned per day*/
SELECT payment_date as "Date", SUM(payment_total) AS "Total Earned"
FROM payments
GROUP BY payment_date
ORDER BY payment_date;

/* Manager - Shows salary of each employee registered*/
SELECT CONCAT(employee_name, " has a salary of: " , employee_salary)  AS "Salary"
FROM employees;

/* Manager - Shows the name and email address of customers whose name begins with the letter M */
SELECT customer_name AS "Name", customer_email AS "Email"
FROM customers
WHERE customer_name LIKE "M%" ;

/* Manager - Shows all whose names end with ic*/
SELECT * FROM customers 
WHERE customer_name REGEXP "ic";

/* Manager - adds the 1.1 overtime bonus to all emplyoees with hours greater than 42 */
SELECT employee_name,employee_salary * 1.1  AS "Overtime Salary"
FROM employees
where employee_hours >= "42";