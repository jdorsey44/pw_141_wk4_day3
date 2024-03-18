SELECT customers.*
FROM customers
JOIN city ON customers.city_id = city.city_id
WHERE city.country = 'USA' AND city.state = 'TX';
Get all payments above $6.99 with the Customer's Full Name:


SELECT customers.full_name, payments.amount
FROM customers
JOIN payments ON customers.customer_id = payments.customer_id
WHERE payments.amount > 6.99;
Show all customers names who have made payments over $175 


SELECT full_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM payments
    WHERE amount > 175
);
List all customers that live in Nepal 


SELECT customers.*
FROM customers
JOIN city ON customers.city_id = city.city_id
WHERE city.country = 'Nepal';
Which staff member had the most transactions?

SELECT staff_id, COUNT(*) AS transaction_count
FROM payments
GROUP BY staff_id
ORDER BY transaction_count DESC
LIMIT 1;
How many movies of each rating are there?

SELECT rating, COUNT(*) AS movie_count
FROM movies
GROUP BY rating;
Show all customers who have made a single payment above $6.99 

SELECT full_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM payments
    GROUP BY customer_id
    HAVING COUNT(*) = 1 AND MAX(amount) > 6.99
);
How many rentals did our stores give away?

SELECT COUNT(*) AS free_rentals_count
FROM rentals
WHERE rental_rate = 0;