# Day 14

# Union

- Unions are different from joins. Joins are using conditions to combine tables but unions just add two tables on top of the other. To use UNION we will write:
```sql
SELECT col1, col2, ... FROM table1
UNION
SELECT col1, col2, ... FROM table2
```
- Both selects must obey the following rules:

- The number of fields should be equal
- Order is important
- The columns in the same place must match the data types
- For example, let's assume we have the following tables:

germany_people

 id  |	name 
|----|-------|
 1	 | Lena  
 2 	 | Leonie

england_people

|id  |name   |
|----|-------|
|1	 |George |
|2	 | Lena  |

Problem: We want to make one big table of all the names we have.

SELECT name from germany_people
UNION
SELECT name from england_people
Result:

city
Lena
Leonie
George
UNION returns only distinct values while UNION ALL return all of the records as-is:

SELECT city from germany_cities
UNION ALL
SELECT city from england_cities
Result:

city
Lena
Leonie
George
Lena

## Challange
