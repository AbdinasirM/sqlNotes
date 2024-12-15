/*
Topic: Combining WHERE and HAVING Clauses for Grouped Data

Purpose:
- This query calculates the average invoice totals for cities that start with the letter "B" and filters the results to include only cities where the average invoice total is greater than $5.00.
- It combines the `WHERE` clause to filter individual rows and the `HAVING` clause to filter aggregated results.

Key Features:
1. **Filtering Rows with WHERE**:
   - The `WHERE` clause filters rows to include only cities that start with the letter "B."
   - This filtering happens before the rows are grouped.
2. **Grouping with GROUP BY**:
   - Groups the remaining rows by `BillingCity` to calculate aggregate statistics for each city.
3. **Filtering Aggregated Data with HAVING**:
   - The `HAVING` clause filters grouped results to include only cities where the average total is greater than $5.00.
4. **Formatting Results**:
   - Uses the `ROUND` function to format the average values to two decimal places.
5. **Sorting**:
   - Orders the results alphabetically by `BillingCity`.

Definitions:
- **WHERE Clause**: Filters rows before grouping; used for individual row conditions.
- **GROUP BY Clause**: Groups rows with the same value in a specified column and applies aggregate functions to each group.
- **HAVING Clause**: Filters grouped results based on aggregated values.
- **LIKE Operator**: Searches for patterns in a column, with `%` representing zero or more characters.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query calculates the average invoice totals for cities starting with "B" and filters grouped results with averages greater than $5.00.
*/

-- The SELECT statement calculates average invoice totals for filtered cities and filters aggregated results:
SELECT
    BillingCity AS "City",                -- Retrieves the city name and renames the column to "City."
    ROUND(AVG(total), 2) AS "Avg Total"  -- Calculates the average total per city and rounds to 2 decimal places.
FROM
    Invoice                              -- Specifies the Invoice table as the source of the data.
WHERE
    BillingCity LIKE "b%"                -- Filters rows to include only cities that start with the letter "B."
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
-- 3. WHERE clause:
--    - Filters rows to include only those where `BillingCity` starts with "B."
--    - The `LIKE "b%"` pattern matches any city name that begins with "B."
--      - Example:
--        `BillingCity = "Boston"` => Match.
--        `BillingCity = "Berlin"` => Match.
--        `BillingCity = "Chicago"` => No Match.
-- 4. GROUP BY clause:
--    - Groups the filtered rows by the `BillingCity` column.
--    - Ensures the `AVG` function is applied to each group (i.e., each city starting with "B") independently.
-- 5. HAVING clause:
--    - Filters the grouped results to include only cities where the average total is greater than $5.00.
--      - Example:
--        AVG(total) = 4.99 => Excluded.
--        AVG(total) = 5.01 => Included.
-- 6. ORDER BY clause:
--    - Sorts the filtered results alphabetically by city name.

-- Example of Table Structure:

-- Invoice Table:
-- | InvoiceId | BillingCity  | Total  |
-- |-----------|--------------|--------|
-- | 1         | Berlin       | 6.00   |
-- | 2         | Boston       | 200.00 |
-- | 3         | Boston       | 250.00 |
-- | 4         | Chicago      | 4.00   |

-- After applying the query:
-- | City         | Avg Total |
-- |--------------|-----------|
-- | Berlin       | 6.00      |
-- | Boston       | 225.00    |

-- Explanation of Results:
-- - The `WHERE` clause filters out rows where `BillingCity` does not start with "B."
-- - The `GROUP BY` clause groups the remaining rows by city.
-- - The `AVG(total)` function calculates the average invoice total for each city:
--   - Berlin: 6.00
--   - Boston: (200.00 + 250.00) / 2 = 225.00
-- - The `HAVING` clause filters out cities where the average total is less than or equal to $5.00:
--   - Chicago: Excluded.
-- - The `ORDER BY` clause sorts the remaining results alphabetically by city name.

-- Purpose:
-- This query is useful for:
-- - Generating city-specific insights for targeted business decisions.
-- - Filtering and analyzing financial data for specific groups of cities.
-- - Producing reports that focus on cities starting with a particular letter or pattern.

-- Notes:
-- - The `WHERE` clause filters rows before grouping, while the `HAVING` clause filters grouped results.
-- - The `ROUND` function ensures consistent formatting for numeric results.

-- Alternative Queries:
-- - To filter cities starting with another letter, adjust the `LIKE` condition:
--   WHERE BillingCity LIKE "C%";
-- - To include additional grouping, such as by state:
--   GROUP BY State, BillingCity
--   HAVING AVG(total) > 5;
-- - To sort by the highest average total instead of city name:
--   ORDER BY AVG(total) DESC;
