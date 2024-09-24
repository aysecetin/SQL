# *Day 16*

## *The Castle Inventory*

## *Challenge*

- To build a castle the builder needs to have many tools. It is difficult to understand which tools he should use and in which order to use them. For that, we will extract the important information and help the builder create his castle.

- Return the name, difficulty and the accumulating sum of the difficulty ordered by the difficulty in ascending order. Call this column tot_until_now

## *Solution*
```sql

SELECT name ,difficulty, SUM(difficulty) OVER (ORDER BY row_num ASC) AS tot_until_now
FROM(
    SELECT name, difficulty, ROW_NUMBER() OVER (order by difficulty asc) as row_num 
    FROM tools
)
order by difficulty
```

## *Tools to use*

## *Challenge*

- To build a castle the builder needs to have many tools. It is difficult to understand which tools he should use and in which order to use them. For that, we will extract the important information and help the builder create his castle. 

- Now the builder has a strength table that indicates the number of points he has to handle the tools every hour. Each hour he can use each tool once, and he should use as many tools as he can every hour. A tool difficulty is the number of points the builder is using. 

- Return the hour, points and the points he used that hour - call this column used

## *Solution*

```sql
WITH cumulating AS (
    SELECT SUM(difficulty) OVER (ORDER BY row_num ASC) as tot_until_now
    FROM (
        SELECT name, difficulty, ROW_NUMBER() OVER (order by difficulty asc) as row_num 
        FROM tools
    )
    order by difficulty 
)

SELECT hour, power, (
    SELECT tot_until_now 
    FROM cumulating 
    WHERE tot_until_now <= power 
    ORDER BY tot_until_now DESC
    LIMIT 1
    ) as used
FROM strength
```
