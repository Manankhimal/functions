/* ----------------Question 1---------------
 1. Write the SQL query to create the above table with all constraints.

Create database PW; 
use pw; 
create table employee (
emp_id int primary key not NULL,
emp_name Varchar(200) not NULL,
age Int, CHECK(age>18),
email varchar(200),
salary int
);

 ----------------Question 2---------------
-- 2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of constraints.
-- ANS. Constraints help enforce rules at the database level, preventing the entry of invalid data and ensuring data accuracy and reliability. Implementing various types of constraints such as primary key,
-- foreign key, unique, not null, check, and default constraints is crucial for upholding data quality. 

 ----------------Question 3---------------
-- 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.
-- The NOT NULL constraint is applied to a column to enforce that the column must always contain a value. It is done becouse of 
--  1> Data Integrity: It ensures that critical data fields are never left empty. This is crucial for maintaining the accuracy and consistency of your database.
-- 						For example, in a "Customers" table, you might apply NOT NULL to the "CustomerID," "FirstName," "LastName," and "Email" columns to ensure you always have essential customer information.
-- 2> Business Rules: It can enforce business rules that require certain fields to be populated. For instance, an "OrderDate" in an "Orders" table must always have a value to be meaningful.
-- 3> Preventing Errors: Allowing NULL values in certain columns can lead to unexpected behavior and errors in queries and applications that rely on that data. calculations, and reports.
-- 4> Required Information: When information is required for the record to be useful, not null is very important.
    
--  Primary Key : NO a primary key cannot have a Null value 
--  1> Uniqueness: A primary key's fundamental purpose is to uniquely identify each row in a table. If a primary key column could contain NULL values, it would violate this uniqueness requirement. Multiple rows could have NULL as their primary key value, making it impossible to distinguish them.
-- 2> Identification: Primary keys are used to establish relationships between tables (foreign keys). If a primary key could be NULL, it would break these relationships, as foreign keys rely on referencing valid primary key values.
-- 3> Definition: By definition, a primary key is a column or set of columns that uniquely identifies a row in a table and it cannot contain nulls. Primary key constraints are a combination of UNIQUE and NOT NULL constraints.

 ----------------Question 4---------------
4.  Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.
ANS: Constraints in SQL are rules enforced on data in tables to maintain integrity. You can add or remove constraints on an existing table using ALTER TABLE commands.
1. Adding a Constraint
Steps to Add a Constraint
->	Use the ALTER TABLE command.
->	Specify the table name.
->	Use the ADD CONSTRAINT clause.
->  Define the type of constraint (e.g., PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, DEFAULT).

ALTER TABLE Employees
ADD CONSTRAINT unique_email UNIQUE (email);


2. Removing a Constraint
->	Steps to Remove a Constraint
->	Use the ALTER TABLE command.
->	Specify the table name.
->	Use the DROP CONSTRAINT clause.
->	Provide the name of the constraint (found in INFORMATION_SCHEMA.TABLE_CONSTRAINTS or defined during creation).
 
ALTER TABLE Employees
DROP CONSTRAINT unique_email;


 ----------------Question 5---------------
5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. Provide an example of an error message that might occur when violating a constraint.
Ans: SQL constraints ensure data integrity and consistency in a database. When an operation violates a constraint (such as PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, or NOT NULL), the database rejects the operation and returns an error.

1. Violating a PRIMARY KEY Constraint
A PRIMARY KEY constraint ensures that a column has unique, non-null values. Attempting to insert a duplicate value will result in an error.
	Example:
		INSERT INTO Employees (id, name) VALUES (1, 'Alice');
		INSERT INTO Employees (id, name) VALUES (1, 'Bob'); -- Violates PRIMARY KEY constraint

	Error Message:
		ERROR: duplicate key value violates unique constraint "employees_pkey"
        
2. Violating a FOREIGN KEY Constraint
A FOREIGN KEY constraint ensures referential integrity between two tables. If an inserted value does not exist in the referenced table, it causes an error.
	Example:
		INSERT INTO Orders (order_id, customer_id) VALUES (101, 999); -- 999 does not exist in Customers table

	Error Message:
		ERROR: insert or update on table "Orders" violates foreign key constraint "orders_customer_id_fkey"


3. Violating a UNIQUE Constraint
A UNIQUE constraint ensures that all values in a column are distinct. Attempting to insert a duplicate value leads to an error.
	Example:
		INSERT INTO Users (
  */      
 -- --------------Question 6---------------
ALTER TABLE products
ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);

ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;


 -- --------------Question 7---------------
 SELECT student_name, c. Class_name From student as s
 inner join class as c
 on s.class_id = c.class_id; 
 
  -- --------------Question 8---------------
SELECT o. order_id, c.customer_name, p.product_name From orders as o
Left join customers as c
on o.customer_id =  c.customer_id 
left join products as p
on o.product_id = p.product_id; 

 -- --------------Question 9---------------
 SELECT SUM(s.Amount) as Total_sales, p.product_name from SAles as s
 inner join products as p
 on s.product_id = p.product_id 
 Group by p.product_name ;
 
  -- --------------Question 10---------------
  SELECT o.order_id, c.customer_name, od.Quantaty FROM Orders
  INNER JOIN Customer as c
  ON o.customer_id = c.cuatomer_id 
  INNER JOIN Order_details as od
  ON o.order_id = od.order_id; 




-- -------------------------------------------------------------------------SQL COMMANDS------------------------------------------------------------------------------------------------

-- ----------------Question 1---------------
/*In the Maven Movies Database, each table typically has:
-> Primary Keys (PKs): Unique identifiers for each record in a table.
-> Foreign Keys (FKs): References to primary keys from other tables to establish relationships.

Table Name: actor, film, customer
Primary Key (PK): actor_id, film_id, customer_id 
and so on...*

Table Name: film_actor, film_actor, film_category
Foreign Key (FK): actor_id, film_id, film_id
References (PK in): actor(actor_id), film(film_id), film(film_id)*/


 -- ----------------Question 2---------------
SELECT * from actor;


 -- ----------------Question 3---------------
SELECT * from Customer;


 -- ----------------Question 4---------------
 SELECT country from Country;


  -- ----------------Question 5---------------
   SELECT  First_name, last_name, active from Customer;


-- ----------------Question 6---------------
SELECT  rental_ID  from Rental
where Customer_ID= 1;

-- ----------------Question 7---------------
 SELECT rental_duration , film_id, title From Film 
 where Rental_duration > 5;


 -- ----------------Question 8---------------
 select Count(Film_id), replacement_cost From film
 where replacement_cost > 15 and replacement_cost<20
 GROUP BY Film_id;


  -- ----------------Question 9---------------
  SELECT distinct(first_name)from Actor;


-- ----------------Question 10---------------
SElECT First_name from customer
limit 10;


-- ----------------Question 11---------------
select first_name from customer
where first_name like "b%"
order by first_name 
limit 3;


-- ----------------Question 12---------------
Select  title From film
where rating = 'G'
limit 3; 

-- ----------------Question 13---------------
SELECT FIrst_name from Customer
where first_name like 'a%';

-- ----------------Question 14---------------
SELECT FIrst_name from Customer
where first_name like '%a';


-- ----------------Question 15---------------
SELECT city from city
where city like 'a%a' 
limit 4 ;

-- ----------------Question 16---------------
SELECT FIrst_name from Customer
where first_name like '%ni%';


-- ----------------Question 17---------------
SELECT * from Customer
where first_name like '_r%';

-- ----------------Question 18---------------
SELECT * FROM customer
where First_name like 'a%'and length(First_name) >=5;

-- ----------------Question 19---------------
SELECT * from customer 
where First_name like 'a%o'; 

-- ----------------Question 20---------------
SELECT * from film
where rating in ('pg', 'pg-13'); 

-- ----------------Question 21---------------
SELECT * 
FROM film 
WHERE length BETWEEN 50 AND 100;

-- ----------------Question 22---------------
SELECT * from actor
limit 50;

-- ----------------Question 23---------------
SELECT Distinct(film_ID) From Inventory;


-- ------------------------------------------------FUNCTIONS----------------------------------------------

-- ----------------Question 1---------------
SELECT Count(*) from rental;

-- ----------------Question 2---------------
SELECT AVG(DATEDIFF(return_date, rental_date)) AS average_rental_duration
FROM rental;

-- ----------------Question 3---------------
SELECT upper(last_name), upper(last_name) From customer;

-- ----------------Question 4---------------
SELECT Month(rental_date), rental_id FROM rental;
 -- ----------------Question 5---------------
 SELECT count(*) as rental_id , customer_id From customer
 Group by customer_Id;
 
 -- ----------------Question 6---------------
SELECT S.STORE_ID, SUM(P.AMOUNT) AS TOTAL_REVENUE
FROM PAYMENT AS P
JOIN CUSTOMER AS C 
ON P.CUSTOMER_ID = C.CUSTOMER_ID
JOIN STORE AS S
ON C.STORE_ID = S.STORE_ID
GROUP BY S.STORE_ID;

-- ----------------Question 7--------------
SELECT fc.category_id, c.name AS category_name, COUNT(r.rental_id) AS total_rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY fc.category_id, c.name
ORDER BY total_rentals DESC;

-- ----------------Question 8--------------
SELECT l.language_id, l.name AS language_name, AVG(f.rental_rate) AS average_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.language_id, l.name
ORDER BY average_rental_rate DESC;

-- ----------------Question 9 --------------
SELECT f.title, c.first_name, c.last_name from rental as r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id;

-- ----------------Question 10 --------------
SELECT a.first_name, a.last_name from film as f
join film_actor as fa
ON fa.film_id = f.film_id
JOIN actor as a
on fa.actor_id = a.actor_id
where f.title ="Gone with the Wind.";

-- ----------------Question 11 --------------
SELECT c.first_name , c.last_name, Sum(p.amount)as total_amount FROM Customer as c
JOIN  payment as p
ON p.customer_id = c.customer_id
join rental as r
ON p.rental_id = r.rental_id
Group by c.first_name, c.Last_name;

 -- ----------------Question 12--------------
SELECT c.customer_id, c.first_name, c.last_name, f.title, ci.city
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY c.customer_id, f.title
ORDER BY c.customer_id, f.title;

-- ------------------------------Advanced Joins and GROUP BY:------------------------------------------

 -- ----------------Question 13--------------
SELECT 
    f.title AS movie_title, 
    COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

-- ----------------Question 14--------------
SELECT c.customer_id, c.first_name, c.last_name FROM rental r
JOIN inventory i 
ON r.inventory_id = i.inventory_id
JOIN customer c 
ON r.customer_id = c.customer_id
WHERE i.store_id IN (1, 2)
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.store_id) = 2;


-- ---------------------------------------Windows Function:---------------------------

-- ----------------Question 1--------------
SELECT first_name , Last_name, sum(p.amount) as total ,
Rank() over (order by SUM(p.amount) DESC) as ranked 
From Payment as p
JOIN  customer c ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total DESC;


-- ----------------Question 2--------------
SELECT f.Title, SUM(p.amount) as totatl, p.payment_date,
Sum(Sum(p.amount)) OVER (partition by F.film_id order by p.payment_date) as c_revenue
FROM Payment As p
JOIN rental r 
on p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id, f.title, p.payment_date
ORDER BY f.title, p.payment_date;


-- ----------------Question 3--------------
select f.title, f.length ,
 AVG(datediff(r.return_date , r.rental_date))as avg_duration 
 FROM Rental as r
 join inventory as i
 on r.inventory_id = i.inventory_id
 join film as f
 ON i.film_id = f.film_id
 WHERE r.return_date IS NOT NULL
GROUP BY f.film_id, f.title, f.length
ORDER BY f.length, avg_rental_duration DESC;

-- ----------------Question 4--------------
SELECT category_name, movie_title, rental_count
FROM (
    SELECT 
        c.name AS category_name, 
        f.title AS movie_title, 
        COUNT(r.rental_id) AS rental_count,
        RANK() OVER (PARTITION BY c.category_id ORDER BY COUNT(r.rental_id) DESC) AS ranking
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.category_id, c.name, f.film_id, f.title
) ranked_films
WHERE ranking <= 3
ORDER BY category_name, ranking;


-- ----------------Question 5--------------
 SELECT c.customer_id, c.first_name, c.last_name, 
COUNT(r.rental_id), AVG(count(r.rental_id)) over() as avg_rental,
count(r.rental_ID) - avg (count(r.rental_id)) Over() as rental_Diff
from rental as r
JOIN customer as c ON r.customer_id = c.customer_id 
Group by c.customer_id , c.first_name, c.last_name
order by rental_diff desc;

-- ----------------Question 6--------------
SELECT date_format(p.payment_date , '%y-%m') as Month,
Sum(p.amount) as month_rev,
sum(sum(p.amount)) OVER(order by date_format(p.payment_date , '%y-%m'))
from payment as p
Group by month
order by month;

-- ----------------Question 7--------------
SELECT customer_id, CONCAT(first_name, ' ', last_name) AS customer_name, total_spent
FROM (SELECT c.customer_id, 
	  c.first_name, 
	  c.last_name, 
	  SUM(p.amount) AS total_spent,
	  PERCENT_RANK() OVER (ORDER BY SUM(p.amount) DESC) AS spending_rank
      FROM customer c
      JOIN payment p
      ON c.customer_id = p.customer_id
      GROUP BY c.customer_id, c.first_name, c.last_name) AS ranked_customers
WHERE spending_rank <= 0.20
order by total_spent;

-- ----------------Question 8--------------
SELECT 
    category_name, 
    movie_title, 
    rental_count, 
    SUM(rental_count) OVER (PARTITION BY category_name ORDER BY rental_count DESC) AS running_total
FROM (
    SELECT 
        c.name AS category_name, 
        f.title AS movie_title, 
        COUNT(r.rental_id) AS rental_count
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY c.name, f.title
) rental_counts
ORDER BY category_name, rental_count DESC;

-- ----------------Question 9--------------
SELECT month, monthly_revenue
FROM (SELECT DATE_FORMAT(p.payment_date, '%Y-%m') AS month, 
      SUM(p.amount) AS monthly_revenue,
      RANK() OVER (ORDER BY SUM(p.amount) DESC) AS revenue_rank
      FROM payment p
      GROUP BY month) AS ranked_months
WHERE revenue_rank <= 5
ORDER By monthly_revenue;



-- ----------------Question 10--------------
SELECT category_name, film_id, title, rental_count, avg_rental_count
FROM (SELECT c.name AS category_name, 
	  f.film_id, 
	  f.title, 
	  COUNT(r.rental_id) AS rental_count,
	  AVG(COUNT(r.rental_id)) OVER (PARTITION BY c.name) AS avg_rental_count
      FROM film f
      JOIN film_category fc 
      ON f.film_id = fc.film_id
      JOIN category c 
      ON fc.category_id = c.category_id
      JOIN inventory i 
      ON f.film_id = i.film_id
      JOIN rental r 
      ON i.inventory_id = r.inventory_id
      GROUP BY c.name, f.film_id, f.title) AS rental_data
WHERE rental_count < avg_rental_count
ORDER BY category_name;

-- -------------------------------------Normalisation & CTE----------------------------------------
-- ----------------Question 1--------------
/*### Violation of 1NF in the Sakila Database  

  First Normal Form (1NF) ensures that:  
1. Each column has atomic values (no multiple values in one field).  
2. There are **no repeating groups** in a table.  

####   Table That Violates 1NF: `film_text` 
In the Sakila database, the `film_text` table violates 1NF because:  
- The `description` column stores multiple details (genre, actors, and summary in one field).  
- It lacks atomicity, making queries inefficient.  

####   Normalization to Achieve 1NF  
To fix this:  
1. Split `description` into separate attributes (`genre`, `summary`).  
2. Create a new table `film_actor` to store actors separately.  

  New Tables:  
- `film_text (film_id, genre, summary)`  
- `film_actor (film_id, actor_name)`  

This removes multi-valued fields, ensures atomicity, and makes data retrieval more efficient. -- 

-- -----------------------------Question 2-----------------------------------

### **Checking 2NF in the Sakila Database**  

A table is in **Second Normal Form (2NF)** if:  
1. It is in **1NF** (atomic values, no repeating groups).  
2. **No partial dependencies** (non-key attributes must depend on the entire primary key).  

#### **Example: `rental` Table**  
| rental_id | customer_id | inventory_id | rental_date | return_date | staff_id |
|-----------|------------|-------------|-------------|-------------|----------|
| 1         | 101        | 2001        | 2024-01-01  | 2024-01-07  | 3        |

- **Primary Key:** `rental_id`  
- **Partial Dependency:** `staff_id` depends on `inventory_id`, not `rental_id` → **Violates 2NF**  

#### **Normalization to 2NF**  
- Move `staff_id` to a new **`rental_staff`** table.  

**`rental` (2NF Compliant)**  
| rental_id | customer_id | inventory_id | rental_date | return_date |
|-----------|------------|-------------|-------------|-------------|
| 1         | 101        | 2001        | 2024-01-01  | 2024-01-07  |

**New `rental_staff` Table**  
| rental_id | staff_id |
|-----------|---------|
| 1         | 3       |

Now, all attributes fully depend on the primary key, making it **2NF compliant**. 



-- -----------------------------Question 3-----------------------------------
### **Identifying 3NF Violation in the Sakila Database**  

#### **Understanding Third Normal Form (3NF)**  
A table is in **Third Normal Form (3NF)** if:  
1. It is already in **Second Normal Form (2NF)**.  
2. **No transitive dependencies** exist – meaning **non-key attributes should depend only on the primary key, not on other non-key attributes**.  

---

### **Table That Violates 3NF: `customer`**  
| customer_id | store_id | first_name | last_name | address_id | address | city | postal_code | country |
|------------|---------|------------|-----------|------------|---------|------|-------------|---------|
| 101        | 1       | John       | Doe       | 5001       | XYZ St  | Miami  | 33101        | USA     |
| 102        | 2       | Jane       | Smith     | 5002       | ABC Rd  | Dallas | 75001        | USA     |

---

#### **Transitive Dependencies in `customer` Table**  
- **Primary Key:** `customer_id`  
- **Issue:** `city` and `country` depend on `address_id`, not directly on `customer_id`.  
- This creates a **transitive dependency** (`customer_id → address_id → city, country`).  

---

### **Normalization to 3NF**  
To remove transitive dependencies:  
1. **Separate address-related details** into a new `address` table.  
2. **Keep only `address_id`** in `customer`, linking it to `address`.  

#### **New `customer` Table (3NF Compliant)**  
| customer_id | store_id | first_name | last_name | address_id |
|------------|---------|------------|-----------|------------|
| 101        | 1       | John       | Doe       | 5001       |
| 102        | 2       | Jane       | Smith     | 5002       |

#### **New `address` Table**  
| address_id | address | city   | postal_code | country |
|------------|---------|--------|-------------|---------|
| 5001       | XYZ St  | Miami  | 33101       | USA     |
| 5002       | ABC Rd  | Dallas | 75001       | USA     |

Now, all attributes depend **only on the primary key** of their respective tables, ensuring **3NF compliance**. 

-- -----------------------------Question 4-----------------------------------
### **Normalization of `customer` Table (Up to 2NF)**  

#### **Unnormalized Form (UNF)**  
| customer_id | name      | phone_numbers      | address  | city   | postal_code | country |
|------------|----------|------------------|---------|--------|-------------|---------|
| 101        | John Doe | 123456, 789012   | XYZ St  | Miami  | 33101       | USA     |

**Issue:** Multi-valued `phone_numbers`.  

#### **1NF (Atomic Values, No Repeating Groups)**  
| customer_id | name      | phone_number | address  | city   | postal_code | country |
|------------|----------|-------------|---------|--------|-------------|---------|
| 101        | John Doe | 123456      | XYZ St  | Miami  | 33101       | USA     |
| 101        | John Doe | 789012      | XYZ St  | Miami  | 33101       | USA     |

**Fix:** Separated multi-valued `phone_numbers`.  

#### **2NF (Remove Partial Dependency)**  
**Issue:** `address`, `city`, `postal_code`, and `country` depend only on `customer_id`.  

**Solution:** Split into separate tables.  

1. **`customer` Table**  
| customer_id | name      | address_id |
|------------|----------|------------|
| 101        | John Doe | 5001       |

2. **`customer_phone` Table**  
| customer_id | phone_number |
|------------|-------------|
| 101        | 123456      |
| 101        | 789012      |

3. **`address` Table**  
| address_id | address  | city   | postal_code | country |
|------------|---------|--------|-------------|---------|
| 5001       | XYZ St  | Miami  | 33101       | USA     |

Now, the table is in **2NF** with no partial dependencies. */

-- -----------------------------Question 5-----------------------------------
WITH ActorFilmCount AS (
    SELECT 
        a.actor_id, 
        a.first_name || ' ' || a.last_name AS actor_name, 
        COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id, actor_name
)
SELECT * FROM ActorFilmCount
ORDER BY film_count DESC;

-- -----------------------------Question 6-----------------------------------
with Combine as (
Select f.title, l.name, f.rental_rate 
FROM film as f
JOIN Language as l on f.language_id = l.language_id
)
select* from Combine;

-- -----------------------------Question 7-----------------------------------
WITH CustomerRevenue AS (
    SELECT 
        c.customer_id, 
        c.first_name || ' ' || c.last_name AS customer_name, 
        SUM(p.amount) AS total_revenue
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, customer_name
)
SELECT * FROM CustomerRevenue
ORDER BY total_revenue DESC;

-- -----------------------------Question 8-----------------------------------
WITH FilmRanking AS (
    SELECT 
        film_id, 
        title, 
        rental_duration, 
        RANK() OVER (ORDER BY rental_duration DESC) AS ranked
    FROM film
)
SELECT * FROM FilmRanking;

-- -----------------------------Question 9-----------------------------------
WITH RentalCount AS (
    SELECT 
        customer_id, 
        COUNT(rental_id) AS total_rentals
    FROM rental
    GROUP BY customer_id
    HAVING COUNT(rental_id) > 2
)
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    c.email, 
    c.active, 
    rc.total_rentals
FROM customer c
JOIN RentalCount rc ON c.customer_id = rc.customer_id;


-- -----------------------------Question 10-----------------------------------
WITH MonthlyRentals AS (
    SELECT 
        DATE_FORMAT(rental_date, '%Y-%m') AS rental_month, 
        COUNT(rental_id) AS total_rentals
    FROM rental
    GROUP BY rental_month
)
SELECT * FROM MonthlyRentals
ORDER BY rental_month;

-- -----------------------------Question 11-----------------------------------
WITH ActorPairs AS (
    SELECT 
        fa1.film_id, 
        fa1.actor_id AS actor1, 
        fa2.actor_id AS actor2
    FROM film_actor fa1
    JOIN film_actor fa2 
        ON fa1.film_id = fa2.film_id 
        AND fa1.actor_id < fa2.actor_id  -- Avoids duplicate pairs
)
SELECT 
    f.title AS film_title, 
    a1.actor_id AS actor1_id, 
    CONCAT(a1.first_name, ' ', a1.last_name) AS actor1_name,
    a2.actor_id AS actor2_id, 
    CONCAT(a2.first_name, ' ', a2.last_name) AS actor2_name
FROM ActorPairs ap
JOIN film f ON ap.film_id = f.film_id
JOIN actor a1 ON ap.actor1 = a1.actor_id
JOIN actor a2 ON ap.actor2 = a2.actor_id
ORDER BY f.title, actor1_name, actor2_name;


-- -----------------------------Question 12-----------------------------------
WITH StoreHierarchy AS (
    -- Select staff details and their store manager
    SELECT 
        s.staff_id, 
        CONCAT(s.first_name, ' ', s.last_name) AS staff_name, 
        s.store_id,
        st.manager_staff_id AS reports_to
    FROM staff s
    JOIN store st ON s.store_id = st.store_id
)
-- Retrieve all employees along with their manager's ID
SELECT 
    sh.staff_id, 
    sh.staff_name, 
    sh.store_id,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name
FROM StoreHierarchy sh
JOIN staff m ON sh.reports_to = m.staff_id; 



