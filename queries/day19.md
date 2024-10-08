# *Day 19*

## COUNT OPERATOR

- The COUNT function is used to count the number of rows.
- COUNT does not count null values.
- Let's find the total number of students.

```sql
SELECT COUNT(*)
FROM students
```

## EXAMPLE
- Find the total number of names of all the students.
- Instead of COUNT(*) we can use COUNT(name) to solve this problem.

```sql
SELECT COUNT(name)
FROM students
```
- It's not obvious but if we are not using * then sql by default adds ALL.
- Let's see the same code with ALL.

```sql
SELECT COUNT(ALL name)
FROM students
```
- Besides ALL the other option is to use DISNTICT.

```sql
SELECT COUNT(DISTINCT name)
FROM students
```

