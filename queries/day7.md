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
