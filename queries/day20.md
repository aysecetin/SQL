# *Day 20*
## Challange
### HackerRank: Revising the Select Query 
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
| Field       | Type          |
|-------------|---------------|
| ID          | NUMBER        |
| NAME        | VARCHAR2(17)  |
| COUNTRYCODE | VARCHAR2(3)   |
| DISTRICT    | VARCHAR2(20)  |
| POPULATION  | NUMBER        |

## Solution
```mysql
SELECT * FROM CITY
WHERE COUNTRYCODE = 'USA'
AND POPULATION > 100000;
```

## Challange
### HackerRank: Population Density Difference
Query the difference between the maximum and minimum populations in CITY.

| Field       | Type          |
|-------------|---------------|
| ID          | NUMBER        |
| NAME        | VARCHAR2(17)  |
| COUNTRYCODE | VARCHAR2(3)   |
| DISTRICT    | VARCHAR2(20)  |
| POPULATION  | NUMBER        |

## Solution

```mssql
SELECT MAX(POPULATION) - MIN(POPULATION) AS PopulationDifferences
FROM CITY;
```
