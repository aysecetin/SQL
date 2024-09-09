# Day 5 

## Challange

Fetch the top 5 severe criminal names in descending order (by severe_score) that are not listed in the police report.
A severe criminal is someone who matches the following criteria:

report is either empty, or the report contains one of the following letters: g, b, G, or B.
map is one of the following places: Caerleon, Dewsbury, Kirekwall, Findochty.
Name the column as worst_criminals.

## The Table: Police Report 

| Name               | Report ID | Map           | Severe Score |
|--------------------|-----------|---------------|--------------|
| Domingos Holden    | VYyPJw    | Lockinge      | 2            |
| Isabel Enid        |           | Findochty     | 7            |
| Tadgán Musa        | FgDqud    | Kara's Vale   | 10           |
| Filip Baxter       | D1rJqH    | Kirekwall     | 3            |
| Edorta Elias       | pQ53RC    | Dewsbury      | 9            |
| Kəmal Davy         | BsI86j    | Kara's Vale   | 2            |
| Isokrates Bituin   |           | Findochty     | 5            |
| Kassy Ramirus      | Pkjv7J    | Kirekwall     | 7            |
| Doris Blessing     | 0kJXq1    | Dalmerlington | 6            |
| Nedeljka Ganesh    | EVe9ha    | Kara's Vale   | 8            |
| Karlene Timotheus  | 2HUBHz    | Dewsbury      | 7            |
| Emerens Raman      | PAGdHl    | Findochty     | 1            |
| Mijo Ambrosios     |           | Luton         | 5            |
| Karlene Jairus     | 4Z63Q5    | Dalmerlington | 8            |
| Khordad Peter      |           | Findochty     | 2            |
| Biagio Mai         |           | Findochty     | 9            |
| Liwen Sigiward     | B51ETs    | Mansfield     | 3            |
| Svante Mona        | DC0kGh    | Caerleon      | 5            |
| Kshitija Ladislav  | cSA0hA    | Caerleon      | 2            |
| Ha-Eun Tatiana     | YNYhHV    | Kara's Vale   | 4            |

## Solution

```sql
SELECT 
    name AS worst_criminals
FROM 
    police_report
WHERE 
    (report IS NULL OR report = ''OR report LIKE '%g%' OR report LIKE '%b%' OR report LIKE '%G%' OR report LIKE '%B%')
    AND map IN ('Caerleon', 'Dewsbury', 'Kirekwall', 'Findochty')
ORDER BY 
    severe_score DESC
LIMIT 5;
```
------------

## Challange

A chocolate factory does not have enough resources. Chocolate must have 243 grams of sugar to be tasty. Each chocolate brand has a limited amount of sugar. For each brand extract the number of chocolates the factory can produce.

Name the columns brand and choc_num.

## The Table: Factory

| Brand      | Sugar |
|------------|-------|
| Shandiin   | 824   |
| Hordad     | 2289  |
| Harinder   | 1344  |
| Tamandani  | 404   |
| Erdene     | 2025  |
| Buhle      | 875   |
| Ayanda     | 1651  |
| Chima      | 2040  |
| Yolotli    | 2724  |
| Amarjeet   | 2182  |

## Solution 

```sql

SELECT brand, sugar / 243 as choc_num
FROM factory

```


