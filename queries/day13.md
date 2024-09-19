# _Day 13_

## _Not Boring Movies_

Table: Cinema


| Column Name    | Type     |
|----------------|----------|
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |

- id is the primary key (column with unique values) for this table.
- Each row contains information about the name of a movie, its genre, and its rating.
- rating is a 2 decimal places float in the range [0, 10]
 
## _Question_
- Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

- Return the result table ordered by rating in descending order.

- The result format is in the following example.

 

**_Example 1:_**

**_Input:_** 
Cinema table:

| id | movie      | description | rating |
|----|------------|-------------|--------|
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |

**_Output:_** 

| id | movie      | description | rating |
|----|------------|-------------|--------|
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |

**_Explanation:_**
- We have three movies with odd-numbered IDs: 1, 3, and 5. The movie with ID = 3 is boring so we do not include it in the answer.


## _Solution_

```mysql

SELECT *  -- id, movie, description, rating 
FROM Cinema
WHERE id % 2 = 1
  AND description != 'boring'
ORDER BY rating DESC;
```

# _RIGHT AND LEFT JOINS_

-An inner join allows us to retrieve combined records from two tables where a certain condition is met. However, there may be situations where we need to retrieve all records from one table and also the data from the other table where the condition is met. For that we have the **RIGHT**, **LEFT**.

- For all of the explanations we will first assume we have the following tables:

courses:
course_id |	lecturer_id
----------|-------------
1	        | 1
2	        |	2
3	        |	10

lecturers:
lecturer_id	| lecturer_name
------------|--------------
1	          | Jhonas
2	          | Malidos
3	          | Eva

**_Problem:_** We want to fetch all of the courses and replace the lecturer_id with lecturer_name. If the condition will not be met then the missing value should be null. To solve it we need to use either the LEFT or RIGHT join. RIGHT is not supported here but it is exactly the same as LEFT.

```sql
SELECT courses.course_id, courses.lecturer_id, lecturers.lecturer_name
FROM courses
LEFT JOIN lecturers ON courses.lecturer_id = lecturers.lecturer_id
```
_Result:_

course_id	| lecturer_id	| lecturer_name
----------|-------------|---------------
1	        | 1	          |	Jhonas
2	        | 2	          | Malidos
3	        | 10	 

- All records that the condition was met there is a value. others have remained with a null value.

- The same thing we can do with RIGHT join, Just replace the tables from FROM and LEFT JOIN:

```sql
... FROM lecturers RIGHT JOIN courses ...
... FROM courses LEFT JOIN lecturers ...
```

## _Question_

- Return the top 5 customers who have spent the most on all of their orders.

- The total spending should be calculated by multiplying the unit price and quantity for each item in each order, and then summing up all the products.

- The result should consist of two columns: customer_id and total_spending, and should be sorted in descending order based on the total_spending column.

## _Solution_

```sql

SELECT orders.customer_id, SUM(order_items.quantity * products.price) AS total_spending
FROM order_items
LEFT JOIN orders ON orders.id = order_items.order_id 
JOIN products ON order_items.product_id = products.id
GROUP BY order_id
ORDER BY total_spending DESC
LIMIT 5
```

# _SELF JOIN_

- Self-joins are different types of joins. As of now, we talked about multiple table joins, but self-joins are joined to the same table. A classic example would be a table of employees.

employees:

employee_id	| employee_name |	manager_id
------------|---------------|-----------
1           |	Minke         |	2
2           |	Temur         |	3
3           |	Tatjana       |		4
4           |	Marinela      |		 

- Every employee has a manager except the highest manager, and every manager is also an employee.

_**The problem:**_ For each employee we want to know the manager's name.

```sql
SELECT e2.employee_id, e2.employee_name, e1.employee_name
FROM employees as e1
JOIN employees as e2 ON e1.employee_id = e2.manager_id
```
- We join between the same table except one time we call it e1 and the second time it is e2. The join is between the fields employee_idand manager_id.

***The Result:***

employee_id |	employee_name	| manager_name
------------|---------------|-----------
1	          | Minke	        | Temur
2	          | Temur         |	Tatjana
3           |	Tatjana	      | Marinela

## *Question*

- Calculate for each pair of friends how many mutual friends they have. Name the columns as friend1, friend2 and num_mutual_friends.

- Don't include pairs with 0 mutual friends.

- A mutual friend is when both: alice and bob are friends with John.


## *Solution*

```sql
SELECT f1.name AS friend1, f2.name AS friend2, COUNT(f3.name) AS num_mutual_friends
FROM friends f1
JOIN friends f2 ON f1.friend_id = f2.id
JOIN friends f3 ON f1.friend_id = f3.friend_id AND f3.id != f1.id AND f3.id != f2.id
GROUP BY friend1, friend2
ORDER BY num_mutual_friends DESC
```

## *Question*


| Column Name   | Type    |
|---------------|---------|
| product_id    | int     |
| start_date    | date    |
| end_date      | date    |
| price         | int     |

(product_id, start_date, end_date) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the price of the product_id in the period from start_date to end_date.
For each product_id there will be no two overlapping periods. That means there will be no two intersecting periods for the same product_id.
 

Table: UnitsSold


| Column Name   | Type    |
|---------------|---------|
| product_id    | int     |
| purchase_date | date    |
| units         | int     |

This table may contain duplicate rows.
Each row of this table indicates the date, units, and product_id of each product sold. 
 

Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. If a product does not have any sold units, its average selling price is assumed to be 0.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Prices table:

| product_id | start_date | end_date   | price  |
|------------|------------|------------|--------|
| 1          | 2019-02-17 | 2019-02-28 | 5      |
| 1          | 2019-03-01 | 2019-03-22 | 20     |
| 2          | 2019-02-01 | 2019-02-20 | 15     |
| 2          | 2019-02-21 | 2019-03-31 | 30     |

UnitsSold table:

| product_id | purchase_date | units |
|------------|---------------|-------|
| 1          | 2019-02-25    | 100   |
| 1          | 2019-03-01    | 15    |
| 2          | 2019-02-10    | 200   |
| 2          | 2019-03-22    | 30    |

Output: 

| product_id | average_price |
|------------|---------------|
| 1          | 6.96          |
| 2          | 16.96         |

Explanation: 
Average selling price = Total Price of Product / Number of products sold.
Average selling price for product 1 = ((100 * 5) + (15 * 20)) / 115 = 6.96
Average selling price for product 2 = ((200 * 15) + (30 * 30)) / 230 = 16.96

## *Solution*

```mysql

SELECT 
    p.product_id,
    IFNULL(ROUND(SUM(us.units * p.price) / SUM(us.units), 2), 0) AS average_price
FROM 
    Prices p
LEFT JOIN 
    UnitsSold us
ON 
    p.product_id = us.product_id
AND 
    us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 
    p.product_id;
```



