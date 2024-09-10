# Day 6 

## Challenge
***Medium***

A chocolate factory does not have enough resources. Chocolate must have 243 grams of sugar to be tasty. Each chocolate brand has a limited amount of sugar.

The factory also has a history book. The book shows how many chocolates the factory made for specific days and for which brand.

For each brand, extract the average chocolates (from the book table) that were made, round the result to 2 decimals places, and extract the number of chocolates the factory can produce now (from the factory table).

Name the columns brand, choc_num, choc_avg. Sort the results by choc_avg in descending order. 

## Solution

```sql
SELECT factory.brand, sugar / 243 as choc_num, choc_avg
FROM factory
jOIN (
    SELECT brand, ROUND(avg(chocolates), 2) as choc_avg
    FROM book
    GROUP BY brand
) as book_avg ON book_avg.brand = factory.brand
ORDER BY choc_avg DESC
```

## Challenge
***Hard***

A chocolate factory does not have enough resources. Chocolate must have 243 grams of sugar to be tasty. Each chocolate brand has a limited amount of sugar.

The factory also has a history book. The book shows how many chocolates the factory made for specific days and for which brand.

For each brand, extract the average chocolates (from the book table) that were made. Round the result to 2 decimals places, and extract the number of chocolates the factory can produce now (from the factory table).

Not all of the brands are relevant. The analyst doesn't like odd numbers, so he decided to sort the brand's name in descending order and investigate only the even rows.

Return only the even rows (when sorting the rows by brand's name in descending order) and also return the row number (when sorted by brand in descending order).

Name the columns brand, choc_num, choc_avg, row_num. Sort the results by choc_avg in descending order. 

## Solution

```sql

SELECT * FROM (
    SELECT factory.brand, sugar / 243 as choc_num, choc_avg, ROW_NUMBER() OVER (ORDER BY factory.brand DESC) as row_num
    FROM factory
    jOIN (
        SELECT brand, ROUND(avg(chocolates), 2) as choc_avg
        FROM book
        GROUP BY brand
    ) as book_avg ON book_avg.brand = factory.brand
    ORDER BY choc_avg DESC
)
WHERE row_num % 2 = 0
```

