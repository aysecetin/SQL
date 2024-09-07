# Day #3 

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
