# Sub-select and Inner Join Exercises

This is a checkpoint Lab, please submit to your git-hub classroom repository (CheckPoint1)

## Sub‐Select in Where

Use a sub‐select in the “where” clause to answer these – even if you can see alternative queries using a join.

### Sakila on Maria

1. List the names of all of the cities in Indonesia (there are 14)

   ```sql
   select city 
   from city where country_id 
   in (select country_id from country where country = 'Indonesia');
   ```

2. How many customers made a payment of $6 or more (answer is 589 – what is the query?)

   ```sql
   select count(*) 
   from customer where customer_id 
   in (select payment.customer_id from payment where payment.amount >= 6);
   ```

3. How many films are not in the inventory? (answer is 42)

   ```sql
   select count(*) 
   from film where film_id 
   not in (select film_id from inventory where inventory.film_id = film.film_id);
   ```

4. List longest films (hint max(length)? (there are 10) - ***I could not figure this one out***

   ```sql
   select title, length
   from film as f1
   where not exists
   (select *
   from film as f2
   where f1.length < f2.length);
   
   # I have no idea how to use max(length) in a way that works
   # This is the only way I could get the result needed
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

   

8. List the names of the students who applied to an institution but were not accepted anywhere.
    - This is tricky to do in a sub-select. If you get six people – but a different six then you are almost there, but you’ve included people that don’t fit the above requirement. 
    - The actual answer is two people – Bob and Craig.

    ```sql
    
    ```

### Join Exercises

**Use the Sakila database on Maria**

#### Two Table Joins

9. List all of the cities in Indonesia – using a join rather than sub‐query
```sql
    
```
10. Make a list showing the number of payments  for each customer (hint – needs a join and a group by). Order this list by the number of payments to identify the most frequent customers.
```sql
    
```

#### Self Join

11. There are two actors with the same name – what is the name of those actors?
```sql
select act1.actor_id, act1.first_name, act1.last_name,
act2.actor_id as actor_id, act2.first_name as first_name, act2.last_name as last_name
from actor act1 join actor act2 on act1.last_name = act2.last_name
where act1.actor_id != act2.actor_id
and act1.first_name = act2.first_name;
```
#### Three Table Joins

12. List the title of the films along with their category
```sql
select film.title as Movie, category.name as Category
from film 
join film_category
on film.film_id = film_category.film_id
join category
on film_category.category_id = category.category_id
order by category.name;
```
13. List the title of the films in which THORA TEMPLE appears.
```sql
select film.title as Movie, actor.first_name, actor.last_name
from film 
join film_actor
on film.film_id = film_actor.film_id
join actor
on film_actor.actor_id = actor.actor_id
where actor.first_name = "thora"
and actor.last_name = "temple";
```

#### Four Table Joins

14. List the names and addresses (including city and country) of all of the staff
```sql
select staff.first_name, staff.last_name, address.address, city.city, country.country
from staff 
join address
on staff.address_id = address.address_id
join city
on address.city_id = city.city_id
join country
on city.country_id = country.country_id;
```
15. List the films each customer has rented, ordered by customer name
```sql
select first_name as "First Name", last_name as "Last Name", film.title as "Film Title"
from customer
join rental
on customer.customer_id = rental.customer_id
join inventory
on rental.inventory_id = inventory.inventory_id
join film
on inventory.film_id = film.film_id
order by customer.last_name;
```

#### Six Tables

Getting silly now?

16. List the number of actors who have been seen in films rented by each customer
```sql
select customer.first_name as "First Name", customer.last_name as "Last Name", count(actor.actor_id) as "actors", count(film.film_id) AS "films watched"
from customer
join rental
on customer.customer_id = rental.customer_id
join inventory
on rental.inventory_id = inventory.inventory_id
join film
on inventory.film_id = film.film_id
join film_actor
on film.film_id = film_actor.film_id
join actor
on film_actor.actor_id = actor.actor_id
group by film.title;
```

