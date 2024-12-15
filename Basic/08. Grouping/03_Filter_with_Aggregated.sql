/*
Topic: Using GROUP BY with the HAVING Clause for Aggregated Data

Purpose:
- This query calculates the average invoice totals for each city and filters the results to include only cities where the average invoice total is greater than $5.00.
- It demonstrates the use of the `HAVING` clause, which is specifically designed for filtering aggregated data.

Key Features:
1. **GROUP BY for Aggregation**:
   - Groups rows by the `BillingCity` column to calculate aggregate statistics (e.g., average total) for each city.
2. **Filtering Aggregated Data with HAVING**:
   - The `HAVING` clause filters grouped results based on the aggregated values.
   - Unlike the `WHERE` clause, which filters rows before grouping, `HAVING` operates on aggregated data.
3. **Formatting Results**:
   - Uses the `ROUND` function to format the average values to two decimal places for better readability.
4. **Sorting**:
   - Orders the results alphabetically by the `BillingCity` column.

Definitions:
- **GROUP BY Clause**: Groups rows with the same value in a specified column and applies aggregate functions to each group.
- **HAVING Clause**: Filters aggregated data after the grouping has been performed.
- **Aggregate Functions**: Functions like AVG, SUM, and COUNT that operate on a group of rows and return a single result.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query calculates the average invoice totals for each city and filters the results to include only cities with an average total greater than $5.00.
*/

-- The SELECT statement calculates average invoice totals for cities and filters aggregated data using the HAVING clause:
SELECT
    BillingCity AS "City",                -- Retrieves the city name and renames the column to "City."
    ROUND(AVG(total), 2) AS "Avg Total"  -- Calculates the average total per city and rounds to 2 decimal places.
FROM 
    Invoice                              -- Specifies the Invoice table as the source of the data.
GROUP BY
    BillingCity                          -- Groups rows by the `BillingCity` column.
HAVING
    AVG(total) > 5                       -- Filters grouped results to include only cities with an average total greater than $5.00.
ORDER BY
    BillingCity;                         -- Sorts the results alphabetically by city name.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves the `BillingCity` column and renames it to "City."
--    - Applies the `AVG` function to the `total` column to calculate the average invoice total for each city.
--    - Uses the `ROUND` function to format the average values to two decimal places.
-- 2. FROM clause:
--    - Specifies the Invoice table as the source of the data.
-- 3. GROUP BY clause:
--    - Groups rows by the `BillingCity` column.
--    - Ensures the `AVG` function is applied to each group (i.e., each city) independently.
-- 4. HAVING clause:
--    - Filters the grouped results to include only cities where the average total is greater than $5.00.
--      - Example:
--        AVG(total) = 4.99 => Excluded
--        AVG(total) = 5.01 => Included
-- 5. ORDER BY clause:
--    - Sorts the filtered results alphabetically by city name.

-- Example of Table Structure:

-- Invoice Table:
-- | InvoiceId | BillingCity  | Total  |
-- |-----------|--------------|--------|
-- | 1         | Los Angeles  | 150.00 |
-- | 2         | London        | 4.00  |
-- | 3         | Los Angeles  | 250.00 |
-- | 4         | Chicago       | 6.00  |

-- After applying the query:
-- | City         | Avg Total |
-- |--------------|-----------|
-- | Chicago      | 6.00      |
-- | Los Angeles  | 200.00    |

-- Explanation of Results:
-- - The `GROUP BY` clause groups rows by `BillingCity`.
-- - The `AVG(total)` function calculates the average invoice total for each city:
--   - Los Angeles: (150.00 + 250.00) / 2 = 200.00
--   - London: 4.00
--   - Chicago: 6.00
-- - The `HAVING` clause filters out cities where the average total is less than or equal to $5.00:
--   - London: 4.00 => Excluded.
--   - Chicago: 6.00 => Included.
-- - The `ORDER BY` clause sorts the remaining results alphabetically by city name.

-- Purpose:
-- This query is useful for:
-- - Identifying cities with higher average sales for targeted marketing or analysis.
-- - Generating city-specific insights based on financial thresholds.
-- - Filtering grouped data based on aggregate statistics.

-- Notes:
-- - The `HAVING` clause operates on aggregated data and is essential for filtering groups after the `GROUP BY` clause.
-- - The `WHERE` clause cannot be used to filter aggregated results; it is applied before grouping.

-- Alternative Queries:
-- - To filter cities with a minimum total sales threshold instead of an average:
--   HAVING SUM(total) > 1000;
-- - To include additional grouping, such as by state:
--   GROUP BY State, BillingCity
--   HAVING AVG(total) > 5;
-- - To sort by the highest average total first:
--   ORDER BY AVG(total) DESC;
