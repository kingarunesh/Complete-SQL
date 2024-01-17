---------------------------------------------------------------
--				12 - Select
---------------------------------------------------------------
SELECT * FROM actor;

SELECT first_name, last_name FROM actor;

select first_name, last_name from actor;

SELECT * FROM city;

SELECT * FROM payment;



---------------------------------------------------------------
--				13 - Challenge
---------------------------------------------------------------

SELECT first_name, last_name, email FROM customer;



---------------------------------------------------------------
--				14 - Distinct
---------------------------------------------------------------

SELECT * FROM film;
SELECT DISTINCT(release_year) FROM film;
SELECT DISTINCT(rental_duration) FROM film;
SELECT DISTINCT(rental_rate) FROM film;
SELECT DISTINCT(rating) FROM film;
SELECT DISTINCT(special_features) FROM film;


---------------------------------------------------------------
--				16 - Count
---------------------------------------------------------------
SELECT COUNT(*) FROM payment;
SELECT COUNT(amount) FROM payment;
SELECT COUNT(DISTINCT(amount)) FROM payment;


---------------------------------------------------------------
--				18 - Where
---------------------------------------------------------------
SELECT * FROM film;

SELECT * FROM customer WHERE first_name = 'Allan';

SELECT * FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';

SELECT title, rental_rate, replacement_cost, rating FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R';

SELECT COUNT(*) FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R' OR rating = 'PG';

SELECT * FROM film WHERE rental_rate > 4 AND replacement_cost >= 19.99 AND rating = 'R' OR rating = 'PG';

SELECT * FROM film WHERE rating = 'R' OR rating = 'G';
SELECT COUNT(*) FROM film WHERE rating = 'R' OR rating = 'G';

SELECT COUNT(*) FROM film WHERE rating != 'R';




---------------------------------------------------------------
--				19 - Challenge
---------------------------------------------------------------

SELECT email FROM customer WHERE first_name = 'Nancy' AND last_name = 'Thomas';

SELECT description FROM film WHERE title = 'Outlaw Hanky';

SELECT phone FROM address WHERE address = '259 Ipoh Drive';




---------------------------------------------------------------
--				20 - Order By
---------------------------------------------------------------
SELECT * FROM customer
ORDER BY first_name DESC;

SELECT * FROM customer
ORDER BY first_name, last_name ASC;

SELECT * FROM customer
ORDER BY store_id DESC, first_name DESC;

SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id ASC, first_name ASC;




---------------------------------------------------------------
--				21 - limit
---------------------------------------------------------------

SELECT * FROM payment LIMIT 5;

SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 10;


---------------------------------------------------------------
--				22 - Challenge
---------------------------------------------------------------

SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;


SELECT title, length FROM film
ORDER BY length ASC
LIMIT 10;

SELECT COUNT(*) FROM film
WHERE length <= 50;


---------------------------------------------------------------
--				23 - Between
---------------------------------------------------------------
SELECT COUNT(*) FROM payment
WHERE amount BETWEEN 8 AND 9;
-- SELECT COUNT(*) FROM payment
-- WHERE amount >= 8 AND amount <= 9;


SELECT COUNT(*) FROM payment
WHERE amount NOT BETWEEN 8 AND 9;


SELECT COUNT(*) FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-14';



---------------------------------------------------------------
--				24 - IN
---------------------------------------------------------------

SELECT COUNT(*) FROM payment
WHERE amount IN (0.99, 1.98, 1.99);


SELECT COUNT(*) FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99);


SELECT * FROM customer
WHERE first_name IN ('Arunesh', 'Arun', 'Vijay', 'Mary', 'John', 'Smith');



---------------------------------------------------------------
--				25 - Like Ilike
---------------------------------------------------------------

SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

SELECT * FROM customer
WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%';


SELECT * FROM customer WHERE first_name LIKE '%her%';

SELECT * FROM customer WHERE first_name LIKE '_her%';
SELECT * FROM customer WHERE first_name NOT LIKE '_her%';


SELECT * FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY first_name ASC;






---------------------------------------------------------------
--				26 - General Chalenge
---------------------------------------------------------------

-- 		1)
SELECT COUNT(*) FROM payment WHERE amount > 5;


-- 		2)
SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';


-- 		3)
SELECT COUNT(DISTINCT(district)) FROM address;


-- 		4)
SELECT DISTINCT(district) FROM address;


-- 		5)
SELECT COUNT(*) FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;


-- 		6)
SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';






---------------------------------------------------------------
--				28 - Aggregation Functions
---------------------------------------------------------------

SELECT MIN(replacement_cost) FROM film;

SELECT MAX(replacement_cost) FROM film;

SELECT MAX(replacement_cost), MIN(replacement_cost) FROM film;

SELECT MAX(replacement_cost) FROM film WHERE rating = 'R';

SELECT COUNT(*) FROM film;

SELECT AVG(replacement_cost) FROM film;

SELECT ROUND(AVG(replacement_cost), 4) FROM film;

SELECT SUM(replacement_cost) FROM film;




---------------------------------------------------------------
--				30 - Group By
---------------------------------------------------------------

SELECT * FROM payment;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;


SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC;


SELECT staff_id, customer_id, SUM(amount) FROM payment
GROUP BY customer_id, staff_id
ORDER BY customer_id;


-- SELECT * FROM payment;

SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY DATE(payment_date);


SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;




---------------------------------------------------------------
--				31 - Challenge
---------------------------------------------------------------

SELECT staff_id, COUNT(amount) FROM payment GROUP BY staff_id;
SELECT staff_id, COUNT(*) FROM payment GROUP BY staff_id;


SELECT * FROM film;

SELECT rating, AVG(replacement_cost) FROM film
GROUP BY rating;


SELECT * FROM payment;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;




---------------------------------------------------------------
--				32 - Having
---------------------------------------------------------------

-- SELECT customer_id, SUM(amount) FROM payment
-- WHERE customer_id NOT IN (184, 87, 477)
-- GROUP BY customer_id;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;


SELECT * FROM customer;

SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;



---------------------------------------------------------------
--				33 - Having Challenge
---------------------------------------------------------------

SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40;


SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 100;




---------------------------------------------------------------
--				35 - Assessment Test 1
---------------------------------------------------------------

--		1)
SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING sum(amount) > 110;



-- 		2)
SELECT COUNT(*) FROM film
WHERE title LIKE 'J%';



-- 		3)
SELECT first_name, last_name FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;




---------------------------------------------------------------
--				39 - AS
---------------------------------------------------------------

SELECT customer_id AS cus_id, amount AS cost, payment_date AS pay_date
FROM payment;


SELECT customer_id, SUM(amount) AS total_cost
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 150;


SELECT customer_id, amount AS cost
FROM payment
WHERE amount > 11;





---------------------------------------------------------------
--				40 - Inner Join
---------------------------------------------------------------

SELECT *
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id;


SELECT payment_id, customer.customer_id, amount, payment_date, customer.first_name, customer.last_name, email
FROM payment
INNER JOIN customer
ON customer.customer_id = payment.customer_id
ORDER BY customer.first_name;


-- 		join 3 tables
SELECT address.address_id, address.address, address.district, address.phone, city.city, country.country
FROM address
INNER JOIN city
ON address.city_id = city.city_id
	INNER JOIN country
	ON city.country_id = country.country_id;




---------------------------------------------------------------
--				41 - Full Outer Join
---------------------------------------------------------------

SELECT *
FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null OR payment.payment_id IS null;

SELECT *
FROM city
FULL OUTER JOIN country
ON city.country_id = country.country_id
WHERE city.city_id IS null OR country.country_id IS null;





---------------------------------------------------------------
--				42 - Left Outer Join
---------------------------------------------------------------

SELECT film.film_id, film.title, inventory.inventory_id, inventory.store_id
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id;


SELECT film.film_id, film.title, inventory.inventory_id, inventory.store_id
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NULL;




---------------------------------------------------------------
--				42 - Right Outer Join
---------------------------------------------------------------

--		not giving perfect result
SELECT film.film_id, film.title, inventory.inventory_id, inventory.store_id
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id
WHERE film.film_id IS null;






---------------------------------------------------------------
--				45 - Challenge
---------------------------------------------------------------

-- 		1)
SELECT address.district, customer.email
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'California';


-- 		2)
SELECT film.title, actor.first_name, actor.last_name
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
	INNER JOIN actor
	ON actor.actor_id = film_actor.actor_id
	WHERE actor.first_name = 'Nick' AND last_name = 'Wahlberg'
ORDER BY film.title;




---------------------------------------------------------------
--				47 - TimeStamps and Extract
---------------------------------------------------------------

SHOW ALL;

SHOW TIMEZONE;

SELECT NOW();

SELECT TIMEOFDAY();

SELECT CURRENT_TIME;

SELECT CURRENT_DATE;



SELECT EXTRACT(YEAR FROM payment_date) AS pay_year
FROM payment;


SELECT EXTRACT(MONTH FROM payment_date) AS pay_month
FROM payment;


SELECT EXTRACT(DAY FROM payment_date) AS pay_day
FROM payment;


SELECT DISTINCT(EXTRACT(DAY FROM payment_date)) AS pay_day
FROM payment
ORDER BY EXTRACT(DAY FROM payment_date);


SELECT EXTRACT(QUARTER FROM payment_date) as pay_quarter
FROM payment;


SELECT AGE(payment_date)
FROM payment;


SELECT TO_CHAR(payment_date, 'MONTH-YYYY') FROM payment;

SELECT TO_CHAR(payment_date, 'mon/YYYY') FROM payment;

SELECT TO_CHAR(payment_date, 'month/YYYY') FROM payment;

SELECT TO_CHAR(payment_date, 'day/mon/YYYY') FROM payment;

SELECT TO_CHAR(payment_date, 'dd/MM/YYYY') FROM payment;

SELECT TO_CHAR(payment_date, 'dd-MM-YYYY') FROM payment;



---------------------------------------------------------------
--				50 - Challenge
---------------------------------------------------------------

-- 		1)
SELECT DISTINCT(TO_CHAR(payment_date, 'month'))
FROM payment;


-- 		2)
SELECT COUNT(EXTRACT(DOW FROM payment_date)) FROM payment WHERE EXTRACT(DOW FROM payment_date) = 1;

SELECT COUNT(*) FROM payment WHERE EXTRACT(DOW FROM payment_date) = 1;



---------------------------------------------------------------
--				51 - Mathematical Functions and Operators
---------------------------------------------------------------

SELECT ROUND(rental_rate / replacement_cost, 4) * 100 AS percent_cost
FROM film;


SELECT replacement_cost * 100 AS deposite
FROM film;




---------------------------------------------------------------
--				52 - String Functions and Operators
---------------------------------------------------------------

SELECT first_name || last_name FROM customer;

SELECT first_name || ' ' || last_name aS full_name FROM customer;

SELECT UPPER(first_name) || ' ' || UPPER(last_name) aS full_name FROM customer;

SELECT LOWER(first_name) || LOWER(last_name) || '@gmail.com' FROM customer;

SELECT first_name, LENGTH(first_name) AS first_name_length FROM customer;

-- 		select first 2 letter
SELECT LEFT(first_name, 2) FROM customer;





---------------------------------------------------------------
--				.....
---------------------------------------------------------------
SELECT * FROM payment;

















