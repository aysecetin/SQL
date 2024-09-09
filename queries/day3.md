# Day #3 

**Challange**

- Fetch all of the cellphone models that start with the letter m and the 3rd letter is o, the price range is between 1000 and 1500, and they support 5G.

- Return only the cellphone model and replace the name to id

**Solution**
```sql
SELECT model as id
FROM cellphones
WHERE model LIKE 'm%_o%' AND price BETWEEN 1000 AND 1500 AND wifi_5g IS TRUE

```
------------------


**Challange**

- Every second minister in the government is considered a "safe" minister. 
Your job is to return all of the "safe" ministers sits that want to continue serving in the next government while excluding any minister who spoke a bad word.

- The result should contain only the relevant sits.

- Before starting to solve the challenge take a look at the table data. It is not clean.

**The Table: ministers**

| sit | is_next_gov | is_spoke_bad |
|-----|-------------|--------------|
|  1  |      1      |      0       |
|  2  |      0      |      1       |
|  3  |     yes     |      no      |
|  4  |      no     |      no      |
|  5  |      1      |      no      |
|  6  |     yes     |      no      |
|  7  |      1      |      no      |
|  8  |      0      |     yes      |
|  9  |      0      |      1       |
| 10  |      no     |      1       |
| 11  |     yes     |     yes      |
| 12  |      1      |      1       |
| 13  |      1      |      1       |
| 14  |      1      |      1       |
| 15  |     yes     |      0       |
| 16  |      0      |      0       |
| 17  |      0      |      0       |
| 18  |      0      |      no      |
| 19  |      1      |     yes      |
| 20  |      1      |      no      |
| 21  |      0      |      0       |
| 22  |      1      |      0       |
| 23  |     yes     |      1       |
| 24  |     yes     |      1       |
| 25  |      no     |     yes      |
| 26  |      1      |      no      |
| 27  |      0      |     yes      |
| 28  |     yes     |      no      |
| 29  |      no     |      0       |
| 30  |     yes     |      0       |

**Solution**

```sql
SELECT 
    sit 
FROM 
    ministers
WHERE 
    -- Safe minister condition (even-numbered sit values)
    sit % 2 = 0
    -- Willing to continue serving (is_next_gov is either '1' or 'yes')
    AND (is_next_gov = '1' OR is_next_gov = 'yes')
    -- Exclude those who spoke a bad word (is_spoke_bad is not '1' or 'yes')
    AND (is_spoke_bad != '1' AND is_spoke_bad != 'yes');
```
----------------------

**Challenge**

- Your bar stocks a vast selection of juices, some of which have expired. Identify and sort these juices based on how they should be processed, according to the following criteria:

- Old Expired Juices: These are juices where the expiration year is more than 6 years before the current year. These should be recycled.
- Almost Expired Juices: These are juices expiring this year or the next year. These can be sent for renewal.
Extract the IDs of juices that are either old expired or almost expired. Sort the results based on the urgency of their processing needs, with those needing immediate attention (greater difference between current year and expiration year) first.

- Rename the ID column to `to_renew` in your output.

**The Table: beverages**

|     | id           | current_year    | expiration_year |
|-----|--------------|-----------------|-----------------|
|  1  |     145      |      2013       |      2014       |
|  2  |     156      |      2001       |      2015       |
|  3  |     167      |      2009       |      2004       |
|  4  |     178      |      2005       |      2000       |
|  5  |     124      |      2013       |      2006       |
|  6  |     189      |      2002       |      2014       |
|  7  |     198      |      2007       |      2013       |
|  8  |     201      |      2004       |      2007       |
|  9  |     206      |      2000       |      2000       |
| 10  |     112      |      2011       |      2002       |
| 11  |     209      |      2008       |      2004       |
| 12  |     125      |      2015       |      2012       |
| 13  |     980      |      2008       |      2005       |
| 14  |     402      |      2010       |      2011       |
| 15  |     391      |      2008       |      2009       |
| 16  |     144      |      2015       |      2013       |
| 17  |     213      |      2014       |      2007       |
| 18  |     100      |      2001       |      2000       |
| 19  |     145      |      2002       |      2004       |
| 20  |     981      |      2011       |      2014       |
| 21  |     210      |      2002       |      2007       |
| 22  |     392      |      2010       |      2006       |
| 23  |     393      |      2007       |      2013       |
| 24  |     113      |      2010       |      2002       |
| 25  |     255      |      2001       |      2008       |

```sql

SELECT id AS to_renew
FROM beverages
WHERE 
    -- Old Expired Juices: expired more than 6 years ago
    expiration_year < current_year - 6 
    OR 
    -- Almost Expired Juices: expiring this year or next year
    expiration_year BETWEEN current_year AND current_year + 1
ORDER BY 
    CASE 
        -- Prioritize Old Expired Juices: Bigger difference means higher urgency
        WHEN expiration_year < current_year - 6 THEN current_year - expiration_year 
        -- Prioritize Almost Expired Juices: Closer expiration date means higher urgency
        WHEN expiration_year BETWEEN current_year AND current_year + 1 THEN current_year + 1 - expiration_year
    END DESC;

```
