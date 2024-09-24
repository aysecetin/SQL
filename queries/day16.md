# *Day 16*

## The Castle Inventory

## Challenge

- To build a castle the builder needs to have many tools. It is difficult to understand which tools he should use and in which order to use them. For that, we will extract the important information and help the builder create his castle.

- Return the name, difficulty and the accumulating sum of the difficulty ordered by the difficulty in ascending order. Call this column tot_until_now

## Solution
```sql

SELECT name ,difficulty, SUM(difficulty) OVER (ORDER BY row_num ASC) AS tot_until_now
FROM(
    SELECT name, difficulty, ROW_NUMBER() OVER (order by difficulty asc) as row_num 
    FROM tools
)
order by difficulty
```
