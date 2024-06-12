/* SITUATION 
A new client, the owner of the Maven Movies DVD rental busines has reached out to you for help restructuring their non-normalized database.*/

/* Question 1:
Take a look at the mavenmoviesmini schema. What do you notice about it? How many tables are there?
What does the data represent? WHat do you think of the current schema? */

SELECT * FROM inventory_non_normalized;

/* Answer: the schema contains a table named inventory non-normalized which has 4,581 rows and 13 columns. The table include information of films and stores.
Also, there are lot of duplicated information in the datasets which need to be normalise. */

/* Question 2:
If you wanted to break out the data from the inventory_non_normalized table into multiple tables, how many tables do you think would be ideal? 
What would you name those tables?/*

/* Answer: 
-- An inventory table using the invenory_id, film_id, store_id
-- Film table using film_id, title, description, release_year, rental_rate, rating
-- Store table using store_id, store_manager_last_name, store_address, store_city, store_district */

/* Question 3:
Based on your answer from questio #2, create a new shcema with the tables you think will best serve this dataset. */

-- Create a schema named mavenmovies_normalised
CREATE SCHEMA mavenmovies_normalised;
USE mavenmovies_normalised;

/* Question 4:
Use the data from the original schema to populate the tables in your newly optimised schema */

-- Create an Inventory table using the data from the Inventory_non_normalized table
CREATE TABLE inventory
SELECT DISTINCT
	inventory_id,
    film_id,
    store_id
FROM mavenmoviesmini.inventory_non_normalized;

SELECT * FROM inventory;

-- Create a new table Film and populate it with the required columns from the inventory_non_normalized table
CREATE TABLE films
SELECT DISTINCT
	film_id,
	title,
    description,
    release_year,
    rental_rate,
    rating
FROM mavenmoviesmini.inventory_non_normalized; -- a table of 6 columns and 958 rows was created

SELECT * FROM films;

-- Create a new table Store and populate it with the required columns from the inventory_non_normalised table
CREATE TABLE stores
SELECT DISTINCT
	store_id,
	store_manager_first_name,
    store_manager_last_name,
    store_address,
    store_city,
    store_district
FROM mavenmoviesmini.inventory_non_normalized; -- the table contains 6 columns and 2 rows

SELECT * FROM stores;

/* Question 5:
Make sure your tables have the proper primary keys defined and that applicable foreign keys are added.
Add any constraints you think should apply to the data as well (unique, non- NULL etc) */

/* Answer: Below are the constraints asses to each table
-- The inventory_id in the inventory table used as the primary key while the store_id and the film_id are used as the foreign keys and Non- NULL constrainsts was added to all columns
-- The Film table: The film_id was used as the primary key and non-NULL constraint was added to all columns
-- Store table: the store_id was used as the primary key and non-NULL constraint was added to the columns. */

/* Question 6: Finally, after doing all technical work, write a brief summary of what you have done, in a way that your non-technical client can understand. Communicate what you did,
and why your new schema design is better.*/  

/* SUMMARY:
A table Inventory_non_normalized has been broken down into three tables - inventory, films and store leading to the elimination of duplicate values and enabling a well defined relationship between 
the tables using the primary and foreign keys. This will help in ensuring data integrity and reducing too much load on the database. Now the Schema is fully optimized! */ 
