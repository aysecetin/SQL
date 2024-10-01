# *Day 18*

## SELECT DISTINCT

- Find all the courses in which at least one student is enrolled.
- The problem seems easy enough. We need to list items from the course columns.

```sql
SELECT course
FROM students
```

- We want a unique list of all courses which have at least one student enrolled in. This is what DISNTICT does. DISTINCT always returns a unique list.
- Result returned by DISTINCT won't have an item more than once.

```sql
SELECT DISTINCT course
FROM students
```

## EXAMPLE

- Find all the unique age of all the students.

```sql
SELECT DISTINCT age
FROM students
```

