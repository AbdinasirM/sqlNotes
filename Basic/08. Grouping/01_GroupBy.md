/*
Topic: Understanding Grouping and GROUP BY Clause

Purpose:
- This query calculates the average invoice totals grouped by city, returning results for each city in the dataset.
- It demonstrates how to use the `GROUP BY` clause to organize data into groups and compute aggregate statistics for each group.

Key Features:
1. **Grouping with GROUP BY**:
   - The `GROUP BY` clause groups rows that have the same value in a specified column.
   - Aggregate functions (e.g., AVG, SUM) are applied to each group, producing one result per group.
2. **Formatting Results**:
   - Uses the `ROUND` function to format the average values to two decimal places for better readability.
3. **Sorting**:
   - Orders the results alphabetically by the `BillingCity` column.

Definitions:
- **Grouping**: The process of organizing rows into groups based on one or more columns.
- **GROUP BY Clause**: A SQL clause that groups rows with the same value in a specified column and allows aggregate functions to be applied to each group.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query calculates the average invoice total for each city using grouping and formats the results.
*/

-- Example of Incorrect Query:
-- This query attempts to calculate the average invoice totals by city but does not use GROUP BY, resulting in incorrect results.
SELECT
    BillingCity,
    AVG(total)
FROM 
    Invoice;

-- Explanation:
-- - Without `GROUP BY`, the query only calculates the overall average for one city, ignoring other cities.

-- Correct Query:
SELECT
    BillingCity AS "City",                -- Retrieves the city name and renames the column to "City."
    ROUND(AVG(total), 2) AS "Avg Total"  -- Calculates the average total per city and rounds to 2 decimal places.
FROM 
    Invoice                              -- Specifies the Invoice table as the source of the data.
GROUP BY
    BillingCity                          -- Groups rows by the `BillingCity` column.
ORDER BY
    BillingCity;                         -- Sorts the results alphabetically by city name.

-- Explanation of the Correct Query:
-- 1. SELECT clause:
--    - Retrieves the `BillingCity` column and renames it to "City."
--    - Applies the `AVG` function to the `total` column to calculate the average invoice total for each city.
--    - Uses the `ROUND` function to format the average values to two decimal places.
--      - Example:
--        AVG(total) = 123.45678 => ROUND(123.45678, 2) = 123.46
-- 2. FROM clause:
--    - Specifies the Invoice table as the source of the data.
-- 3. GROUP BY clause:
--    - Groups rows in the `Invoice` table by the `BillingCity` column.
--    - Ensures the `AVG` function is applied to each group (i.e., each city) independently.
-- 4. ORDER BY clause:
--    - Sorts the results alphabetically by the city name for easier interpretation.

-- Example of Table Structure:

-- Invoice Table:
-- | InvoiceId | BillingCity | Total  |
-- |-----------|-------------|--------|
-- | 1         | New York    | 100.00 |
-- | 2         | New York    | 200.00 |
-- | 3         | Los Angeles | 150.00 |
-- | 4         | Chicago     | 300.00 |

-- After applying the correct query:
-- | City         | Avg Total |
-- |--------------|-----------|
-- | Chicago      | 300.00    |
-- | Los Angeles  | 150.00    |
-- | New York     | 150.00    |

-- Explanation of Results:
-- - The `GROUP BY` clause groups rows with the same `BillingCity` value.
-- - The `AVG(total)` function calculates the average total for each city:
--   - New York: (100.00 + 200.00) / 2 = 150.00
--   - Los Angeles: 150.00
--   - Chicago: 300.00
-- - The `ORDER BY` clause sorts the results alphabetically by city name.

-- Purpose:
-- This query is useful for:
-- - Summarizing financial data by location for business analysis.
-- - Identifying cities with higher or lower average invoice totals.
-- - Generating region-specific reports or insights for decision-making.

-- Notes:
-- - The `ROUND` function ensures consistent formatting for numeric results.
-- - The `GROUP BY` clause is essential for producing meaningful results when using aggregate functions.

-- Alternative Queries:
-- - To calculate the total invoice amounts by city:
--   SELECT BillingCity, SUM(total) AS "Total Sales"
--   FROM Invoice
--   GROUP BY BillingCity
--   ORDER BY BillingCity;
-- - To filter results for a specific range of averages:
--   WHERE AVG(total) > 200
--   (This requires wrapping the query in a subquery.)
-- - To group by multiple columns (e.g., city and state):
--   GROUP BY BillingCity, State
--   ORDER BY State, BillingCity;
