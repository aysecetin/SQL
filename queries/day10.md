# Day 10

## Subqueries
🤓 Subqueries allow us to combine multiple queries into one.

**EXAMPLE**

electronic_store

id |price	|technology
---|------|----------
1	 |  48  |	13J
2  |	34	| J139
3	 |  46	| 2J6
4	 |  13	| p92
5  |	28	| MJ2

- If we want to calculate the average price for all of the items that the technology contains the letter J then we need to use subqueries.

*GROUP BY* keywords won't help us here because all of the technology terms are different.
```sql
SELECT AVG(price)
FROM (
    SELECT price, technology
    FROM electronic_store
    WHERE technology LIKE '%J%'
)
```
- The inner query returns a table that contains only items that the technology contains the letter J and only after that do we calculate the average price.

**Result:**

|AVG(price)|
|----------|
|39        |


## Challange 

| shop | price | quantity | category | list_date                |
|------|-------|----------|----------|--------------------------|
| 1    | 35    | 1        | garden   | 2015-03-06T22:00:00.000Z |
| 2    | 24    | 2        | food     | 2015-04-10T21:00:00.000Z |
| 3    | 61    | 5        | plants   | 2015-04-12T21:00:00.000Z |
| 4    | 51    | 2        | garden   | 2015-01-15T22:00:00.000Z |
| 5    | 66    | 4        | school   | 2015-03-19T22:00:00.000Z |
| 6    | 47    | 7        | garden   | 2015-01-10T22:00:00.000Z |
| 7    | 62    | 4        | school   | 2015-03-01T22:00:00.000Z |
| 8    | 30    | 7        | school   | 2015-01-03T22:00:00.000Z |
| 9    | 51    | 6        | food     | 2015-02-14T22:00:00.000Z |
| 10   | 59    | 1        | plants   | 2015-01-14T22:00:00.000Z |
| 11   | 50    | 7        | plants   | 2015-02-04T22:00:00.000Z |
| 12   | 42    | 3        | school   | 2015-01-02T22:00:00.000Z |
| 13   | 48    | 6        | plants   | 2015-03-07T22:00:00.000Z |
| 14   | 68    | 7        | food     | 2015-01-18T22:00:00.000Z |
| 15   | 12    | 3        | garden   | 2015-04-17T21:00:00.000Z |


- Your task is to calculate the total gain for each category of items in a shop, considering the data available between January 1, 2015, and March 18, 2015. However, there is an issue with the price values in the data, as they are incorrect.

- To fix this, first, you need to calculate the overall average price of all items within the specified date range (January 1, 2015, to March 18, 2015). Add this average price to the original price of each item to fix the incorrect price values.

- After correcting the price values, calculate the total gain for each category by summing the product of the quantity and the corrected price for each item in that category. The result should be presented as a list of tuples, where the first element is the category and the second element is the total gain. Finally, sort the results by the total gain in descending order.

## Solution 
```sql

SELECT category, SUM(price * quantity) AS total_gain
FROM (
    SELECT price + (SELECT AVG(price) FROM shop WHERE list_date BETWEEN '2015-01-01' AND '2015-03-18') AS price, quantity, category, list_date
    FROM shop
    WHERE list_date BETWEEN '2015-01-01' AND '2015-03-18'
)
GROUP BY category
ORDER BY total_gain DESC
```


