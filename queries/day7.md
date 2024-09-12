# Day 7 

## Challange

Fetch all of the game ids that are not played in the winter.
Winter dates are: 21 December 2022  - 20 March 2023.

Sort them by the date in descending order and rename the column to game

## Table: games

| ID  | Date                      |
| --- | ------------------------- |
| 1   | 2022-11-20T22:00:00.000Z  |
| 2   | 2022-01-11T22:00:00.000Z  |
| 3   | 2023-01-01T22:00:00.000Z  |
| 4   | 2023-02-12T22:00:00.000Z  |
| 5   | 2022-10-28T21:00:00.000Z  |
| 6   | 2022-08-31T21:00:00.000Z  |
| 7   | 2022-12-21T22:00:00.000Z  |
| 8   | 2022-12-19T22:00:00.000Z  |
| 9   | 2022-10-31T22:00:00.000Z  |
| 10  | 2023-03-19T22:00:00.000Z  |


## Solution

```sql
SELECT id as game FROM games
WHERE date BETWEEN '2022-01-11' AND '2022-12-21'
ORDER BY date desc
```


## Challange

### #1
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

The CITY table is described as follows:

## CITY

| Field       | Type          |
|-------------|---------------|
| ID          | NUMBER        |
| NAME        | VARCHAR2(17)  |
| COUNTRYCODE | VARCHAR2(3)   |
| DISTRICT    | VARCHAR2(20)  |
| POPULATION  | NUMBER        |


## Solution

```sql
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'USA'
  AND POPULATION > 120000;
```

### #2
Query all columns (attributes) for every row in the CITY table.


```sql

SELECT *
FROM CITY;
```

### #3
Query all columns for a city in CITY with the ID 1661.

```sql
SELECT * 
FROM CITY
WHERE ID = 1661;
```

### #4
Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

```sql
SELECT *
FROM CITY 
WHERE COUNTRYCODE = 'JPN';
```
### #5
Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

```sql
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';
```

## Challange

### #1
Query a list of CITY and STATE from the STATION table.
The STATION table is described as follows:

## STATION

| Field  | Type          |
|--------|---------------|
| ID     | NUMBER        |
| CITY   | VARCHAR2(21)  |
| STATE  | VARCHAR2(2)   |
| LAT_N  | NUMBER        |
| LONG_W | NUMBER        |

where LAT_N is the northern latitude and LONG_W is the western longitude.

## Solution
```sql
SELECT CITY, STATE
FROM STATION; 
```

### #2
Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

```sql
SELECT DISTINCT CITY 
FROM STATION 
WHERE MOD(ID , 2) = 0 ;
```

### #3
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.


**Sample Input**  
For example, CITY has four entries: DEF, ABC, PQRS and WXY.  

**Sample Output**  
ABC 3    
PQRS 4    

**Explanation**    
When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths  and . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, because it comes first alphabetically.

**Note**  
You can write two separate queries to get the desired output. It need not be a single query.


```sql
WITH CityLengths AS (
    SELECT CITY, LENGTH(CITY) AS Length
    FROM STATION
),
ShortestCity AS (
    SELECT CITY, Length
    FROM CityLengths
    WHERE Length = (SELECT MIN(Length) FROM CityLengths)
    ORDER BY CITY ASC
    LIMIT 1
),
LongestCity AS (
    SELECT CITY, Length
    FROM CityLengths
    WHERE Length = (SELECT MAX(Length) FROM CityLengths)
    ORDER BY CITY ASC
    LIMIT 1
)
SELECT CITY, Length
FROM ShortestCity

UNION ALL

SELECT CITY, Length
FROM LongestCity;
```

### #4
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

```sql
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY LIKE 'A%' OR
      CITY LIKE 'E%' OR
      CITY LIKE 'I%' OR
      CITY LIKE 'O%' OR
      CITY LIKE 'U%';
```

### #5
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

```sql
SELECT DISTINCT CITY
FROM STATION
WHERE 
    SUBSTR(CITY, 1, 1) IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U')
    AND SUBSTR(CITY, LENGTH(CITY), 1) IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');
```

### #6
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

```sql
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT LIKE 'A%' AND
      CITY NOT LIKE 'E%' AND
      CITY NOT LIKE 'I%' AND
      CITY NOT LIKE 'O%' AND
      CITY NOT LIKE 'U%';
```

### #7
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

```sql
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT LIKE '%a' AND
      CITY NOT LIKE '%e' AND
      CITY NOT LIKE '%i' AND
      CITY NOT LIKE '%o' AND
      CITY NOT LIKE '%u';
```
