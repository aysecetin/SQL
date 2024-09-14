# Day 9
## HAVING KEYWORD

The *WHERE* keyword runs a condition on each record separately. For example:

```sql
SELECT * FROM table1
WHERE col1 > col2
The col1 > col2 will run on every record and check if it is met.
```

But what if we want to filter aggregate results? For example:

```sql
SELECT category, AVG(price) FROM table1
WHERE AVG(price) > 40
GROUP BY category
```
This will not work because *WHERE* cannot check any aggregations. For that, we have the HAVING keyword. It filters data by the aggregate condition.

```sql
SELECT category, AVG(price) FROM table1
GROUP BY category
HAVING AVG(price) > 40
This will filter all the categories for which the average price is greater than 40.
```
If we want to combine *HAVING* and *WHERE* clause we will write:

```sql
SELECT category, AVG(price) FROM table1
WHERE price > 25
GROUP BY category
HAVING AVG(price) > 40
```
This will first go record by record and filter all the records for which the price is greater than 25, and only after that will it run the GROUP BY clause and filter every category for which the average price is greater than 40.


### Challange
-----------------

The Richter scale is a logarithmic scale used to measure the magnitude of earthquakes. The formula for the Richter scale is given by M = log10(A/T) + B, where M is the magnitude, A is the amplitude of the seismic waves, T is the period of the waves, and B is a constant.

We need to return the average magnitude for each location of all of the major earthquakes

A major earthquake is defined as:

The amplitude is greater or equal to 1
The period of the waves is greater or equal to 1 minute
For this challenge, we will use a different formula: M = (A/T)2 / T.

Return the location and the average magnitude of each location while including only the major earthquakes (name the column avg_magnitude). Include in your result only the locations where the avg_magnitude is greater than 1

Round the results to 2 decimal places


```sql
SELECT location ,
 ROUND(AVG((amplitude / period) * (amplitude / period) / period), 2) AS avg_magnitude
FROM 
    earthquakes
WHERE 
    amplitude >= 1 
    AND period >= 1
GROUP BY 
    location
HAVING 
    avg_magnitude >= 1 
```
