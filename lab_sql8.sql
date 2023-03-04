
USE Sakila;

#1. Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.
SELECT title, length, DENSE_RANK() OVER (ORDER BY length DESC) AS 'rank'
FROM film WHERE length>0;

#2. Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). 
#In your output, only select the columns title, length, rating and rank.
SELECT title, length,rating, DENSE_RANK() OVER (PARTITION BY rating ORDER BY length DESC) AS 'rank'
FROM film WHERE length>0;

#3. How many films are there for each of the categories in the category table? 
#Hint: Use appropriate join between the tables "category" and "film_category".

SELECT C.category_id, name, COUNT(F.film_id) AS num_films
FROM category AS C
INNER JOIN film_category AS F
ON C.category_id = F.category_id
GROUP BY C.category_id
ORDER BY num_films DESC;

#4. Which actor has appeared in the most films? 
#Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.

SELECT A.actor_id, COUNT(F.film_id) AS num_films
FROM actor AS A
INNER JOIN film_actor AS F
ON A.actor_id=F.actor_id
GROUP BY A.actor_id
ORDER BY num_films DESC;

#5. Which is the most active customer (the customer that has rented the most number of films)? 
#Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.

SELECT C.customer_id, COUNT(R.rental_id) AS num_rental
FROM customer AS C
INNER JOIN Rental AS R
ON C.customer_id=R.customer_id
GROUP BY C.customer_id
ORDER BY num_rental DESC;

#Bonus: Which is the most rented film? (The answer is Bucket Brotherhood).

#This query might require using more than one join statement. Give it a try. We will talk about queries with multiple join statements later in the lessons.
#Hint: You can use join between three tables - "Film", "Inventory", and "Rental" and count the rental ids for each film

