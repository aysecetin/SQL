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

Challenge

Return all of the ids after ordering them by the weight in descending order

```sql

SELECT id
FROM feathers
ORDER BY weight DESC
```
