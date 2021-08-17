# Sub-select and Inner Join Exercises

This is a checkpoint Lab, please submit to your github classroom 
repository (CheckPoint1)

## Sub‐Select in Where

Use a sub‐select in the “where” clause to answer these – even if you can see alternative queries using a join.

### Sakila on Maria

1. List the names of all of the cities in Indonesia (there are 14)

   ```sql
   select city from city where country_id in (select country_id from country where country = 'Indonesia');
   ```

2. How many customers made a payment of $6 or more (answer is 589 – what is the query?)

   ```sql
   select count(*) from customer 
   where customer_id in (select payment.customer_id 
                         from payment where payment.amount >= 6);
   ```

3. How many films are not in the inventory? (answer is 42)

   ```sql
   select count(*) from film
   where film_id not in 
   (select film_id from inventory where inventory.film_id = film.film_id);
   ```

4. List longest films (hint max(length)? (there are 10) - ***I could not figure this one out***

   ```sql
   select title, length
   from film
   order by length desc;
   ```

   

### Student Applications on SQLite - check the ReadMe file

5. Who are the students who share the highest GPA? (there are 4 – what is the query?)

   ```sql
   
   ```

   

6. How many people have a GPA higher than the average? (answer is 7)

   ```sql
   
   ```

7. List the names of the students who were accepted somewhere (there are 6)

   ```sql
   
   ```

   

8. List the names of the students who applied to an institution but were not accepted
  anywhere.
  - This is tricky to do in a subselect. If you get six people – but a different six then you are almost there, but you’ve included people that don’t fit the above requirement. The actual answer is two people – Bob and Craig.

  ```sql
  
  ```

### Join Exercises

Use the Sakila database on Maria

#### Two Table Joins

9. List all of the cities in Indonesia – using a join rather than sub‐query
10. Make a list showing the number of payments  for each customer (hint – needs a join and a group by). Order this list by the number of payments to identify the most frequent customers.

#### Self Join

11. There are two actors with the same name – what is the name of those actors?

#### Three Table Joins

12. List the title of the films along with their category
13. List the title of the films in which  THORA TEMPLE appears.

#### Four Table Joins

14. List the names and addresses (including city and country) of all of the staff
15. List the films each customer has rented, ordered by customer name

#### Six Tables

Getting silly now?

16. List the number of actors who have been seen in films rented by each customer
