# Day 15


## Real estate contractor


## Challenge

- Some analysts forecast what is going to be the growth for real estate assets. We want to check if their forecast is true.
- For each asset in the real_estate table, calculate the ratio between the value of an older date to the value of an earlier date.
- For example, if there is an asset that his value in 2022-01-01 was 5 and in 2022-05-01 was 10 then that ratio is 10/5 = 2.
- Ignore all of the comparisons that the day difference between the two dates is smaller than 101.
- There are many dates for each asset so there are many ratios to compare. keep only the biggest ratio for each asset.
- Finally, divide this ratio with the matching forecast from the potential table (call this field ratio_forecast) and sort the results in descending order.
- The final result should have the asset_id and ratio_forecast.
- Keep only the assets that the ratio_forecast is bigger than 1.

***Note:*** To get a decimal solution from divide operation (/) you sometimes need to multiply the numerator by 1.0.

- For example, instead of a / b use a * 1.0 / b to get the decimal result (when a and b are variables)

## Solution 

```sql
WITH asset_ratios AS (
    -- Self-join on the real_estate table to get pairs of dates with a difference of at least 101 days
    SELECT 
        r1.asset_id,
        r1.value AS value_older,
        r2.value AS value_newer,
        r2.value * 1.0 / r1.value AS ratio
    FROM real_estate r1
    JOIN real_estate r2 
    ON r1.asset_id = r2.asset_id
    AND r2.date > r1.date
    AND (julianday(r2.date) - julianday(r1.date)) >= 101
),
max_ratios AS (
    -- Get the maximum ratio for each asset
    SELECT 
        asset_id,
        MAX(ratio) AS max_ratio
    FROM asset_ratios
    GROUP BY asset_id
),
ratio_forecast_calc AS (
    -- Calculate the ratio_forecast by dividing max_ratio by the forecast value from the potential table
    SELECT 
        mr.asset_id,
        mr.max_ratio,
        mr.max_ratio * 1.0 / p.forecast AS ratio_forecast
    FROM max_ratios mr
    JOIN potential p ON mr.asset_id = p.asset_id
)
-- Filter results where ratio_forecast is greater than 1 and sort in descending order
SELECT 
    asset_id, ratio_forecast
FROM ratio_forecast_calc
WHERE ratio_forecast > 1
ORDER BY ratio_forecast DESC;
```
