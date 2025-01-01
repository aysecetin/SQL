# *Day 20*
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
