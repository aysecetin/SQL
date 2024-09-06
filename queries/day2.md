# Day 2
## Recap challenge #1

As an owner of a vehicle factory, you have agreed to provide a salary raise for the four employees with the lowest salaries who are also married, as they are struggling to finance their families. 
Return only the IDs of the relevant employees. Sort the results by salary in ascending order. 

```sql
SELECT id FROM employees 
WHERE status = 'married'
ORDER BY salary asc
LIMIT 4 

```
## Recap challenge #2

You have a cyber security firm that experienced an arbitrary attack, resulting in all of your systems shutting down. To solve this issue, you need to identify all of the events that appear suspicious. A suspicious event meets one or more of the following criteria:

Its size is significantly different from the average normal event size of 50MB (you'll need to analyze the data in the table to determine the thresholds for 'too small' and 'too big')
It was created before the year 2000
It has a missing name
Your task:

Examine the provided table of events to determine what should be considered 'too small' or 'too big' based on the distribution of event sizes.
Identify all suspicious events based on the criteria mentioned above.
Return the event IDs and their names in descending order by their ID.
Note: The exact thresholds for 'too small' and 'too big' should be inferred from the data. Look for patterns or outliers in the event sizes to make this determination."

```sql

SELECT id, name
FROM events
-- Write your code below
WHERE
    -- We check whether the size is too small (less than 10MB) or too large (greater than 1000MB)
    size < 10 OR size > 1000 OR
    -- We check that the year is before 2000
    year < 2000 OR
    -- We check for missing names
    name IS NULL
ORDER BY id DESC;
```

**Challenge**

Return all of the ids after ordering them by the weight in descending order

```sql

SELECT id
FROM feathers
ORDER BY weight DESC
```

## The IN keyword

- The following query is very long:
```sql
SELECT *
FROM table1
WHERE col1 = 'a' OR col1 = 'b' OR col1 = 'c' OR col1 = 'd' OR ...
```
- We can simplify it by using the IN keyword like this:

```sql
SELECT *
FROM table1
WHERE col1 IN ('a', 'b', 'c', 'd', 'e', 'f')
```
**Challenge**

Return all the records from the following countries:

Oman, Nicaragua, Bhutan, Senegal, Belarus

```sql
SELECT *
FROM countries
WHERE country IN ('Oman', 'Nicaragua', 'Bhutan', 'Senegal', 'Belarus')
```

## The BETWEEN keyword

- As of now, we learned to use bigger > and smaller < to demand a range for a field. But there is another way.

Instead of writing 
```sql
col1 >= 5 AND col1 <= 10 >
```
we can write: 
```sql
col1 BETWEEN 5 AND 10
```

**Challenge**

Fetch all of the records between 5 and 10

```sql
SELECT *
FROM  data 
WHERE value BETWEEN 5 AND 10
```

## The LIKE keyword

- The LIKE keyword is used to check the similarities of strings. For example, if we want to fetch all of the records that the name starts with the letter a then we will use the LIKE keyword.

Two main wildcards are used:

% - means any number of characters  
_ - means exactly one character  

For example:
- %a means any string that ends with a
- a% means any string that starts with a
- %a% means any string that contains a
- _a% means that the letter a is the second character in the string
- %a__ means that the string contains a in the 3rd from last place
 
To use it we will write:

```sql
SELECT col1, col2, ...
FROM table1
WHERE col1 LIKE '%a__'
```


**Challenge**

Fetch all of the people that their name starts with k and ends with a and order the results by the names in descending order.

```sql
SELECT *
FROM people 
WHERE name LIKE 'k%a'
ORDER BY name desc
```

## Aliases

- Column names are important to present data in a meaningful way. If you show a table with bad column names it will be hard for your audience to understand what are you talking about.

To change column names you may use the AS keyword

```sql 
SELECT col1 AS firstColumn, col2 AS secondColumn, ...
FROM table1
```
Challenge

Fetch all of the kitchen items that the cutlery have less than 3 items. Change the cutlery column name to silverware  

```sql
SELECT cutlery AS silverware, amount
FROM kitchen_items 
WHERE amount < 3
```
