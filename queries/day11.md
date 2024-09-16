# Day 11

## Challange 

Table: Employee


| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |

- id is the primary key (column with unique values) for this table.
- Each row of this table indicates the name of an employee, their department, and the id of their manager.
- If managerId is null, then the employee does not have a manager.
- No employee will be the manager of themself.
 

Write a solution to find managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.

 

**Example 1:**

**Input:**

Employee table:

| id  | name  | department | managerId |
|-----|-------|------------|-----------|
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |

**Output:** 

| name |
|------|
| John |

## Solution

```mysql

SELECT 
    e.name
FROM 
    Employee e
JOIN 
    Employee e2 
ON 
    e.id = e2.managerId
GROUP BY 
    e.id, e.name
HAVING 
    COUNT(e2.id) >= 5;
```
### Explanation:

**Self-Join:** We perform a self-join on the Employee table. In the JOIN condition, we check where the id of an employee (e.id) matches the managerId of another employee (e2.managerId), meaning that e is the manager of e2.

**COUNT():** We count the number of employees (e2.id) who report to each manager.

**HAVING COUNT(e2.id) >= 5:** We use the HAVING clause to filter out managers who have fewer than five direct reports.

**GROUP BY:** We group by the id and name of the managers to apply the COUNT() function correctly.

This will return the names of managers with at least five direct reports.
