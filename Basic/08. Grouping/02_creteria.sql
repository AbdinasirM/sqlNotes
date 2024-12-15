/*
Topic: Using GROUP BY with a WHERE Clause

Purpose:
- This query calculates the average invoice totals for cities that start with the letter "L."
- It demonstrates how to use the `WHERE` clause to filter rows before grouping and aggregating data.

Key Features:
1. **Filtering with WHERE**:
   - The `WHERE` clause filters rows to include only those where the `BillingCity` starts with the letter "L."
2. **Grouping with GROUP BY**:
   - Groups the remaining rows by city (`BillingCity`) to calculate aggregate statistics for each group.
3. **Formatting Results**:
   - Uses the `ROUND` function to format the average values to two decimal places for better readability.
4. **Sorting**:
   - Orders the results alphabetically by the `BillingCity` column.

Definitions:
- **WHERE Clause**: Filters rows based on specified conditions before they are grouped or aggregated.
- **GROUP BY Clause**: Groups rows with the same value in a specified column and applies aggregate functions to each group.
- **LIKE Operator**: Searches for patterns in a column, with `%` representing zero or more characters.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query calculates the average invoice total for cities starting with "L," grouped by city.
*/

-- The SELECT statement calculates average invoice totals for filtered cities:
SELECT
    BillingCity AS "City",                -- Retrieves the city name and renames the column to "City."
    ROUND(AVG(total), 2) AS "Avg Total"  -- Calculates the average total per city and rounds to 2 decimal places.
FROM 
    Invoice                              -- Specifies the Invoice table as the source of the data.
WHERE
    BillingCity LIKE 'L%'                -- Filters rows to include only cities that start with the letter "L."
GROUP BY
    BillingCity                          -- Groups rows by the `BillingCity` column.
ORDER BY
    BillingCity;                         -- Sorts the results alphabetically by city name.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves the `BillingCity` column and renames it to "City."
--    - Applies the `AVG` function to the `total` column to calculate the average invoice total for each city.
--    - Uses the `ROUND` function to format the average values to two decimal places.
--      - Example:
--        AVG(total) = 123.45678 => ROUND(123.45678, 2) = 123.46
-- 2. FROM clause:
--    - Specifies the Invoice table as the source of the data.
-- 3. WHERE clause:
--    - Filters the rows to include only those where `BillingCity` starts with "L."
--    - The `LIKE 'L%'` pattern matches any city name that begins with "L."
--      - Example:
--        `BillingCity = 'London'` => Match.
--        `BillingCity = 'Los Angeles'` => Match.
--        `BillingCity = 'New York'` => No Match.
-- 4. GROUP BY clause:
--    - Groups the filtered rows by the `BillingCity` column.
--    - Ensures the `AVG` function is applied to each group (i.e., each city starting with "L") independently.
-- 5. ORDER BY clause:
--    - Sorts the results alphabetically by city name.

-- Example of Table Structure:

-- Invoice Table:
-- | InvoiceId | BillingCity  | Total  |
-- |-----------|--------------|--------|
-- | 1         | Los Angeles  | 150.00 |
-- | 2         | London        | 200.00 |
-- | 3         | Los Angeles  | 250.00 |
-- | 4         | New York      | 300.00 |

-- After applying the query:
-- | City         | Avg Total |
-- |--------------|-----------|
-- | London       | 200.00    |
-- | Los Angeles  | 200.00    |

-- Explanation of Results:
-- - The `WHERE` clause filters out rows where `BillingCity` does not start with "L."
-- - The `GROUP BY` clause groups the remaining rows by city.
-- - The `AVG(total)` function calculates the average invoice total for each city:
--   - Los Angeles: (150.00 + 250.00) / 2 = 200.00
--   - London: 200.00
-- - The `ORDER BY` clause sorts the results alphabetically by city name.

-- Purpose:
-- This query is useful for:
-- - Generating city-specific insights for targeted business decisions.
-- - Filtering and analyzing financial data for specific groups of cities.
-- - Producing reports that focus on cities starting with a particular letter or pattern.

-- Notes:
-- - The `WHERE` clause filters rows before the `GROUP BY` clause groups them.
-- - The `LIKE` operator is case-sensitive in some SQL implementations; use `ILIKE` for case-insensitive searches (e.g., in PostgreSQL).

-- Alternative Queries:
-- - To calculate average totals for cities starting with another letter (e.g., "N"):
--   WHERE BillingCity LIKE 'N%';
-- - To include additional cities that meet other criteria:
--   WHERE BillingCity LIKE 'L%' OR BillingCity LIKE 'N%';
-- - To group and sort by state as well as city:
--   GROUP BY State, BillingCity ORDER BY State, BillingCity;
