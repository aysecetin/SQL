# *Day 17* 🫠

## Challange

**Table: Project**


| Column Name | Type    |
|-------------|---------|
| project_id  | int     |
| employee_id | int     |

(project_id, employee_id) is the primary key of this table.
employee_id is a foreign key to Employee table.
Each row of this table indicates that the employee with employee_id is working on the project with project_id.
 

**Table: Employee**


| Column Name      | Type    |
|------------------|---------|
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |

- employee_id is the primary key of this table. It's guaranteed that experience_years is not NULL.
- Each row of this table contains information about one employee.
 
### ✍🏻✍🏻✍🏻
- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

- Return the result table in any order.

- The query result format is in the following example.

 

**Example 1:**

**Input:** 
**Project table:**

| project_id  | employee_id |
|-------------|-------------|
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |

**Employee table:**

| employee_id | name   | experience_years |
|-------------|--------|------------------|
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |

**Output:**

| project_id  | average_years |
|-------------|---------------|
| 1           | 2.00          |
| 2           | 2.50          |

**Explanation:** The average experience years for the first project is (3 + 2 + 1) / 3 = 2.00 and for the second project is (3 + 2) / 2 = 2.50

## Solution

```mysql
SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM 
    Project p
JOIN 
    Employee e ON p.employee_id = e.employee_id
GROUP BY 
    p.project_id;
```

## Challange

**Table: Users**


| Column Name | Type    |
|-------------|---------|
| user_id     | int     |
| user_name   | varchar |

- user_id is the primary key (column with unique values) for this table.
- Each row of this table contains the name and the id of a user.
 

**Table: Register**


| Column Name | Type    |
|-------------|---------|
| contest_id  | int     |
| user_id     | int     |

- (contest_id, user_id) is the primary key (combination of columns with unique values) for this table.
- Each row of this table contains the id of a user and the contest they registered into.
 

- Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

- Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.

- The result format is in the following example.

 

**Example 1:**

**Input:**
**Users table:**

| user_id | user_name |
|---------|-----------|
| 6       | Alice     |
| 2       | Bob       |
| 7       | Alex      |

**Register table:**

| contest_id | user_id |
|------------|---------|
| 215        | 6       |
| 209        | 2       |
| 208        | 2       |
| 210        | 6       |
| 208        | 6       |
| 209        | 7       |
| 209        | 6       |
| 215        | 7       |
| 208        | 7       |
| 210        | 2       |
| 207        | 2       |
| 210        | 7       |

**Output:** 

| contest_id | percentage |
|------------|------------|
| 208        | 100.0      |
| 209        | 100.0      |
| 210        | 100.0      |
| 215        | 66.67      |
| 207        | 33.33      |

**Explanation:**
- All the users registered in contests 208, 209, and 210. The percentage is 100% and we sort them in the answer table by contest_id in ascending order.
- Alice and Alex registered in contest 215 and the percentage is ((2/3) * 100) = 66.67%
- Bob registered in contest 207 and the percentage is ((1/3) * 100) = 33.33%

## Solution
```mysql
with total_user as (
    select 
        count(*) as cnt
    from
        Users 
)
select
    contest_id, round((count(user_id)*100/t.cnt),2) as percentage
from 
    Register r, total_user t
group by  contest_id
order by percentage desc, contest_id
```
