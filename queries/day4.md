# Day 4

## Challange

You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

| Column     | Type    |
|------------|---------|
| Task_ID    | Integer |
| Start_Date | Date    |
| End_Date   | Date    |


If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.

Sample Input

| Task_ID | Start_Date | End_Date   |
|---------|------------|------------|
| 1       | 2015-10-01 | 2015-10-02 |
| 2       | 2015-10-02 | 2015-10-03 |
| 3       | 2015-10-03 | 2015-10-04 |
| 4       | 2015-10-13 | 2015-10-14 |
| 5       | 2015-10-14 | 2015-10-15 |
| 6       | 2015-10-28 | 2015-10-29 |
| 7       | 2015-10-30 | 2015-10-31 |



Sample Output

2015-10-28 2015-10-29
2015-10-30 2015-10-31
2015-10-13 2015-10-15
2015-10-01 2015-10-04

Explanation

The example describes following four projects:

Project 1: Tasks 1, 2 and 3 are completed on consecutive days, so these are part of the project. Thus start date of project is 2015-10-01 and end date is 2015-10-04, so it took 3 days to complete the project.
Project 2: Tasks 4 and 5 are completed on consecutive days, so these are part of the project. Thus, the start date of project is 2015-10-13 and end date is 2015-10-15, so it took 2 days to complete the project.
Project 3: Only task 6 is part of the project. Thus, the start date of project is 2015-10-28 and end date is 2015-10-29, so it took 1 day to complete the project.
Project 4: Only task 7 is part of the project. Thus, the start date of project is 2015-10-30 and end date is 2015-10-31, so it took 1 day to complete the project.

## Solution
```sql
WITH ProjectGroups AS (
    SELECT
        Task_ID,
        Start_Date,
        End_Date,
        SUM(CASE WHEN Start_Date = LAG(End_Date) OVER (ORDER BY Start_Date) THEN 0 ELSE 1 END) 
        OVER (ORDER BY Start_Date) AS Project_ID
    FROM
        Projects
),
ProjectsSummary AS (
    SELECT
        MIN(Start_Date) AS Project_Start,
        MAX(End_Date) AS Project_End,
        COUNT(*) AS Duration
    FROM
        ProjectGroups
    GROUP BY
        Project_ID
)
SELECT
    Project_Start,
    Project_End
FROM
    ProjectsSummary
ORDER BY
    Duration ASC,
    Project_Start ASC;
```

## Challange

You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

### Students

| Column | Type    |
|--------|---------|
| ID     | Integer |
| Name   | String  |

### Friends

| Column    | Type    |
|-----------|---------|
| ID        | Integer |
| Friend_ID | Integer |

### Packages 

| Column | Type    |
|--------|---------|
| ID     | Integer |
| Salary | Float   |


Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

Sample Input

 ### Students 

| ID | Name      |
|----|-----------|
| 1  | Ashley    |
| 2  | Samantha  |
| 3  | Julia     |
| 4  | Scarlet   |

### Friends 

| ID | Friend_ID |
|----|-----------|
| 1  | 2         |
| 2  | 3         |
| 3  | 4         |
| 4  | 1         |

### Packages 

| ID | Salary |
|----|--------|
| 1  | 15.20  |
| 2  | 10.06  |
| 3  | 11.55  |
| 4  | 12.12  |


Sample Output

Samantha
Julia
Scarlet

Explanation

See the following table:



Now,

Samantha's best friend got offered a higher salary than her at 11.55
Julia's best friend got offered a higher salary than her at 12.12
Scarlet's best friend got offered a higher salary than her at 15.2
Ashley's best friend did NOT get offered a higher salary than her
The name output, when ordered by the salary offered to their friends, will be:

Samantha
Julia
Scarlet

## Solution 

```sql
SELECT S1.Name
FROM Students S1
JOIN Friends F ON S1.ID = F.ID
JOIN Packages P1 ON S1.ID = P1.ID
JOIN Packages P2 ON F.Friend_ID = P2.ID
WHERE P1.Salary < P2.Salary
ORDER BY P2.Salary;
```

