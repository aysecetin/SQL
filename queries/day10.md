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


## 🧐Challenge

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

## 🧐Challenge

Easy
As the manager of a scooter shop, you have noticed that many scooters are not original, meaning they are missing a model name. Furthermore, bad scooters typically do not have lights.

Your task involves two steps:

First, Add to all scooter prices in the shop the overall average price.
Then, Calculate the average price for each brand, considering only good and original scooters (i.e., scooters with a model name and lights).
The result should include the brand and the average price - avg_price. Sort the results by the average price in ascending order.

## Solution

```sql
WITH updated_scooters AS (
    -- Adım 1: Genel ortalama fiyatı eklemek
    SELECT 
        brand,
        model,
        lights,
        price + (SELECT AVG(price) FROM scooters) AS new_price
    FROM scooters
),
good_scooters AS (
    -- Adım 2: İyi ve orijinal scooterları filtrelemek
    SELECT 
        brand,
        new_price
    FROM updated_scooters
    WHERE model IS NOT NULL AND lights = 1
)
-- Adım 3: Her marka için ortalama fiyatı hesaplayıp sıralamak
SELECT 
    brand,
    AVG(new_price) AS avg_price
FROM good_scooters
GROUP BY brand
ORDER BY avg_price ASC;
```

## 🧐Challenge
**Table: Activity**

| Column Name    | Type    |
|----------------|---------|
| machine_id     | int     |
| process_id     | int     |
| activity_type  | enum    |
| timestamp      | float   |

- The table shows the user activities for a factory website.
- (machine_id, process_id, activity_type) is the primary key (combination of columns with unique values) of this table.
- machine_id is the ID of a machine.
- process_id is the ID of a process running on the machine with ID machine_id.
- activity_type is an ENUM (category) of type ('start', 'end').
- timestamp is a float representing the current time in seconds.
- 'start' means the machine starts the process at the given timestamp and 'end' means the machine ends the process at the given timestamp.
- The 'start' timestamp will always be before the 'end' timestamp for every (machine_id, process_id) pair.
- It is guaranteed that each (machine_id, process_id) pair has a 'start' and 'end' timestamp.
 ------------------

* There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process.

* The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.

* The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.

* Return the result table in any order.

* The result format is in the following example.

 

**Example 1:**

**Input:** 
Activity table:

| machine_id | process_id | activity_type | timestamp |
|------------|------------|---------------|-----------|
| 0          | 0          | start         | 0.712     |
| 0          | 0          | end           | 1.520     |
| 0          | 1          | start         | 3.140     |
| 0          | 1          | end           | 4.120     |
| 1          | 0          | start         | 0.550     |
| 1          | 0          | end           | 1.550     |
| 1          | 1          | start         | 0.430     |
| 1          | 1          | end           | 1.420     |
| 2          | 0          | start         | 4.100     |
| 2          | 0          | end           | 4.512     |
| 2          | 1          | start         | 2.500     |
| 2          | 1          | end           | 5.000     |

**Output:**

| machine_id | processing_time |
|------------|-----------------|
| 0          | 0.894           |
| 1          | 0.995           |
| 2          | 1.456           |

**Explanation:**
- There are 3 machines running 2 processes each.
- Machine 0's average time is ((1.520 - 0.712) + (4.120 - 3.140)) / 2 = 0.894
- Machine 1's average time is ((1.550 - 0.550) + (1.420 - 0.430)) / 2 = 0.995
- Machine 2's average time is ((4.512 - 4.100) + (5.000 - 2.500)) / 2 = 1.456

  ## Solution

```mysql
  SELECT
    machine_id
    , round(sum(if(activity_type = 'start', -1, 1) *timestamp)/count(distinct process_id),3) as processing_time
  FROM activity
  GROUP BY machine_id
```

## 🧐Challenge

**Table: Employee**


| Column Name | Type    |
|-------------|---------|
| empId       | int     |
| name        | varchar |
| supervisor  | int     |
| salary      | int     |

- empId is the column with unique values for this table.
- Each row of this table indicates the name and the ID of an employee in addition to their salary and the id of their manager.
 

Table: Bonus


| Column Name | Type |
|-------------|------|
| empId       | int  |
| bonus       | int  |
- empId is the column of unique values for this table.
- empId is a foreign key (reference column) to empId from the Employee table.
- Each row of this table contains the id of an employee and their respective bonus.
 

- Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

- Return the result table in any order.

- The result format is in the following example.

 

Example 1:

**Input:**
*Employee table:*

| empId | name   | supervisor | salary |
|-------|--------|------------|--------|
| 3     | Brad   | null       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |

*Bonus table:*

| empId | bonus |
|-------|-------|
| 2     | 500   |
| 4     | 2000  |

*Output:* 

| name | bonus |
|-------|------|
| Brad | null  |
| John | null  |
| Dan  | 500   |

## Solution 

```mysql

SELECT name, bonus
FROM
    Employee
LEFT JOIN
    Bonus
ON
    Employee.empId = Bonus.empId
WHERE
    bonus < 1000 OR bonus IS NULL
```

