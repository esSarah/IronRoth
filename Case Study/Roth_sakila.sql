USE sakila;

# Instructions
#  1. Review the tables in the database.
#  2. Explore tables by selecting all columns from each table or using the in built review features for your client.

SELECT * FROM STAFF LIMIT 10;
SELECT * FROM INVENTORY LIMIT 10;
SELECT * FROM ACTOR LIMIT 10;
SELECT * FROM sakila.LANGUAGE LIMIT 10;
# SELECT * FROM FILM_ACTOR LIMIT 10;
SELECT * FROM FILM LIMIT 10;
SELECT * FROM CATEGORIE LIMIT 10;
SELECT * FROM STORE LIMIT 10;
SELECT * FROM PAYMENT LIMIT 10;
SELECT * FROM RENTAL LIMIT 10;
SELECT * FROM CUSTOMER LIMIT 10;
SELECT * FROM ADDRESS LIMIT 10;
SELECT * FROM COUNtRY LIMIT 10;
SELECT * FROM STORE LIMIT 10;

#n:m
SELECT * FROM FILM_CATEGORY;
SELECT * FROM FILM_ACTOR;

#  3. Select one column from a table. Get film titles.
SELECT TITLE FROM FILM LIMIT 10;
#  4. Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
SELECT DISTINCT NAME As Film_Languages FROM sakila.LANGUAGE;
#    5.1 Find out how many stores does the company have?
SELECT COUNT(STORE_ID) As Number_of_Stores FROM STORE;
#    5.2 Find out how many employees staff does the company have?
SELECT COUNT(STAFF_ID) As Number_of_Staff FROM STAFF;
#    5.3 Return a list of employee first names only?
SELECT FIRST_NAME FROM STAFF GROUP BY STAFF_ID;

# Playing
SELECT FILM.TITLE, ACTOR.FIRST_NAME, ACTOR.LAST_NAME
	FROM FILM
	INNER JOIN FILM_ACTOR ON FILM_ACTOR.FILM_ID = FILM.FILM_ID 
	INNER JOIN ACTOR ON ACTOR.ACTOR_ID = FILM_ACTOR.ACTOR_ID
ORDER BY FILM.TITLE;
SELECT DISTINCT(FILM_ID), COUNT(ACTOR_ID) AS actors_per_movie FROM FILM_ACTOR GROUP BY FILM_ID;
