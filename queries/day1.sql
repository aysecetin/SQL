-- Fetch all of the people who are either unemployed or between the ages of 20 and 28 (including 20 and 28) but not age 22.

SELECT * 
FROM people
WHERE status = 'unemployed' OR (age BETWEEN 18 AND 28 AND NOT age = 22)

/* 
Conditions are booleans. Boolean is a data type with two possible values: TRUE or FALSE.

For example

10 > 100 - FALSE
10 > 5 - TRUE
10 > 5 AND 100 < 5 - FALSE
Boolean columns have only two values - either 1 or 0. TRUE indicates 1 and FALSE indicates 0

We can replace columns such as employed or unemployed to 1 or 0 to make it easier to filter data. To filter data using booleans we will use the IS TRUE or IS NOT TRUE keywords.
*/


-- Fetch all of the colorful objects. Instead of writing colorful = 1 try to use the TRUE keyword.

SELECT * FROM objects
WHERE colorful IS TRUE
