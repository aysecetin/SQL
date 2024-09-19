# Day 13

## Not Boring Movies 

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
 
## Question
- Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

- Return the result table ordered by rating in descending order.

- The result format is in the following example.

 

**Example 1:**

**Input:** 
Cinema table:

| id | movie      | description | rating |
|----|------------|-------------|--------|
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |

**Output:** 

| id | movie      | description | rating |
|----|------------|-------------|--------|
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |

**Explanation:**
- We have three movies with odd-numbered IDs: 1, 3, and 5. The movie with ID = 3 is boring so we do not include it in the answer.


## Solution

```mysql

SELECT *  -- id, movie, description, rating 
FROM Cinema
WHERE id % 2 = 1
  AND description != 'boring'
ORDER BY rating DESC;
```

# RIGHT AND LEFT JOINS

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

**Problem:** We want to fetch all of the courses and replace the lecturer_id with lecturer_name. If the condition will not be met then the missing value should be null. To solve it we need to use either the LEFT or RIGHT join. RIGHT is not supported here but it is exactly the same as LEFT.

```sql
SELECT courses.course_id, courses.lecturer_id, lecturers.lecturer_name
FROM courses
LEFT JOIN lecturers ON courses.lecturer_id = lecturers.lecturer_id
```
Result:

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
