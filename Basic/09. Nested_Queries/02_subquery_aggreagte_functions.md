/*
Topic: Subqueries with Aggregate Functions

Purpose:
- This query demonstrates how to use a subquery to calculate aggregated data (e.g., totals, averages, counts) and integrate the result into a larger query.
- Subqueries with aggregate functions enable modular and dynamic calculations, such as comparing group-level metrics against overall totals.

Key Features:
1. **Aggregate Functions**:
   - Functions like `SUM`, `AVG`, `MIN`, `MAX`, and `COUNT` summarize column values for a dataset.
2. **Subqueries**:
   - Subqueries are nested SQL queries used to calculate intermediate results or provide data for outer queries.
   - A subquery with an aggregate function can calculate a single scalar value (e.g., total sum or average) to compare or use within another query.
3. **Use Case**:
   - Subqueries are used for operations like comparing each group’s metrics against the overall data, filtering based on global thresholds, or creating reusable components.

Definitions:
- **Aggregate Functions**: Functions that perform calculations on multiple rows and return a single value (e.g., `SUM`, `AVG`, `COUNT`).
- **Subquery**: A query nested within another SQL query, used to provide input for the outer query.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query uses a subquery with aggregate functions to calculate and compare overall metrics against grouped data.
*/

-- Example Query: Compare City-Level Averages with the Global Average
SELECT
    i.BillingCity AS "City",                 -- Retrieves the city name.
    ROUND(AVG(i.Total), 2) AS "Avg City Total", -- Calculates the average invoice total for each city and rounds to two decimal places.
    (SELECT ROUND(AVG(total), 2) FROM Invoice) AS "Global Avg Total" -- Subquery calculates the global average invoice total.
FROM
    Invoice AS i                             -- Specifies the Invoice table as the data source.
GROUP BY
    i.BillingCity                            -- Groups rows by the `BillingCity` column.
ORDER BY
    i.BillingCity;                           -- Sorts results alphabetically by city name.

-- Explanation of the SQL Command Above:
-- 1. SELECT clause:
--    - Retrieves city names and calculates their average invoice totals (outer query).
--    - Uses a subquery to calculate the global average of all invoice totals.
--      - Subquery: SELECT ROUND(AVG(total), 2) FROM Invoice
--        - This calculates the global average total and returns a single scalar value.
--    - Combines city-level data with the global metric for comparison.
-- 2. FROM clause:
--    - Specifies the Invoice table as the data source for the outer query.
-- 3. GROUP BY clause:
--    - Groups rows by `BillingCity`, ensuring each city’s average total is calculated independently.
-- 4. ORDER BY clause:
--    - Sorts the final results alphabetically by city name for better readability.

-- Example of Table Structure:

-- Invoice Table:
-- | InvoiceId | BillingCity  | Total  |
-- |-----------|--------------|--------|
-- | 1         | New York     | 150.00 |
-- | 2         | Los Angeles  | 200.00 |
-- | 3         | New York     | 250.00 |

-- After applying the query:
-- | City         | Avg City Total | Global Avg Total |
-- |--------------|----------------|------------------|
-- | Los Angeles  | 200.00         | 200.00           |
-- | New York     | 200.00         | 200.00           |

-- Explanation of Results:
-- - The subquery calculates the global average total:
--   - Global Avg Total = (150.00 + 200.00 + 250.00) / 3 = 200.00
-- - The outer query calculates the average total for each city:
--   - New York: (150.00 + 250.00) / 2 = 200.00
--   - Los Angeles: 200.00
-- - Both metrics are presented in the final result.

-- Purpose:
-- This query is useful for:
-- - Comparing regional performance metrics (e.g., city-level averages) against global performance benchmarks.
-- - Creating reusable subqueries to calculate intermediate results.
-- - Supporting data-driven decision-making with detailed insights.

-- Notes:
-- - Subqueries must return a single scalar value when used in a SELECT clause.
-- - Aggregate functions like `AVG` and `SUM` must operate on the appropriate dataset to ensure accuracy.

-- Alternative Queries:
-- - To filter for cities with averages above the global average:
--   SELECT i.BillingCity, ROUND(AVG(i.Total), 2) AS "Avg City Total"
--   FROM Invoice AS i
--   GROUP BY i.BillingCity
--   HAVING AVG(i.Total) > (SELECT AVG(total) FROM Invoice);
-- - To calculate the difference between city-level and global averages:
--   SELECT i.BillingCity, ROUND(AVG(i.Total), 2) AS "Avg City Total",
--          ROUND(AVG(i.Total), 2) - (SELECT ROUND(AVG(total), 2) FROM Invoice) AS "Difference"
--   FROM Invoice AS i
--   GROUP BY i.BillingCity
--   ORDER BY Difference DESC;
