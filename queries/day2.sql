-- Recap challenge #1

/*As an owner of a vehicle factory, you have agreed to provide a salary raise for the four employees with the lowest salaries who are also married, as they are struggling to finance their families. 
Return only the IDs of the relevant employees. Sort the results by salary in ascending order. */

SELECT id FROM employees 
WHERE status = 'married'
ORDER BY salary asc
LIMIT 4 
