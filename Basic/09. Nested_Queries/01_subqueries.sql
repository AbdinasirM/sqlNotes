/*
Topic: Using Subqueries with Aggregate Functions

Purpose:
- This query demonstrates the use of a basic aggregate function to calculate the average invoice total and wraps it in a subquery for further processing or integration into a larger query.
- Subqueries allow for modular, reusable SQL components, enabling more complex logic and results.

Key Features:
1. **Aggregate Function**:
   - Uses the `AVG` function to calculate the average invoice total from the `Invoice` table.
2. **Result Formatting**:
   - Applies the `ROUND` function to format the average value to two decimal places.
3. **Subquery Basics**:
   - A subquery, also known as a nested query, is a query wrapped inside another query.
   - Subqueries are used to pass results as input to an outer query or calculate intermediate results.

Definitions:
- **Aggregate Functions**: Functions like AVG, SUM, and COUNT that operate on a column and return a single aggregated result.
- **Subquery**: A query nested within another query, often used as input for the outer query.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query calculates the average invoice total using an aggregate function and demonstrates how it can be used in a subquery.
*/

-- Basic Query:
-- This query calculates the average invoice total and rounds it to two decimal places:
SELECT
    ROUND(AVG(total), 2) AS "Average Total" -- Calculates the average total and formats it to 2 decimal places.
FROM
    Invoice;                               -- Specifies the Invoice table as the source of the data.

-- Explanation of the Basic Query:
-- 1. SELECT clause:
--    - Applies the `AVG` function to the `total` column to calculate the average invoice total.
--    - Uses the `ROUND` function to format the result to two decimal places for readability.
--      - Example:
--        AVG(total) = 123.45678 => ROUND(123.45678, 2) = 123.46
-- 2. FROM clause:
--    - Specifies the Invoice table as the source of the data.

-- Example of Table Structure:

-- Invoice Table:
-- | InvoiceId | Total  |
-- |-----------|--------|
-- | 1         | 150.00 |
-- | 2         | 200.00 |
-- | 3         | 250.00 |

-- After applying the query:
-- | Average Total |
-- |---------------|
-- | 200.00        |

-- Explanation of Results:
-- - The `AVG(total)` function calculates the average of all invoice totals:
--   - (150.00 + 200.00 + 250.00) / 3 = 200.00
-- - The `ROUND` function formats the result to two decimal places.

-- Subquery Example:
-- Now let’s demonstrate how this basic query can be used as a subquery.

SELECT
    i.BillingCity AS "City",                 -- Retrieves the city name.
    ROUND(AVG(i.Total), 2) AS "Avg City Total", -- Calculates the average total per city.
    (SELECT ROUND(AVG(total), 2) FROM Invoice) AS "Global Avg Total" -- Subquery calculates the global average.
FROM
    Invoice AS i                             -- Specifies the Invoice table as the data source.
GROUP BY
    i.BillingCity                            -- Groups rows by the `BillingCity` column.
ORDER BY
    i.BillingCity;                           -- Sorts results alphabetically by city name.

-- Explanation of the Subquery:
-- 1. SELECT clause:
--    - Retrieves the city name and average total per city (from the outer query).
--    - Includes the global average total (calculated by the subquery).
-- 2. Subquery:
--    - Calculates the global average total using the same basic query logic:
--      SELECT ROUND(AVG(total), 2) FROM Invoice
-- 3. GROUP BY clause:
--    - Groups rows by city to calculate the average for each city independently in the outer query.
-- 4. ORDER BY clause:
--    - Sorts the results alphabetically by city name for readability.

-- Example of Table Structure with Subquery:

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
-- - The `AVG(total)` function calculates the global average (200.00) using the subquery.
-- - The outer query calculates the average invoice total for each city independently:
--   - New York: (150.00 + 250.00) / 2 = 200.00
--   - Los Angeles: 200.00

-- Purpose:
-- Subqueries like this are useful for:
-- - Comparing city-specific metrics against global averages.
-- - Reusing modular query components in a larger query.
-- - Calculating intermediate results for use in further processing.

-- Notes:
-- - Ensure that the subquery returns a scalar (single value) when used in a SELECT list.
-- - The `ROUND` function ensures consistent formatting for numeric results.

-- Alternative Queries:
-- - To calculate the difference between the global and city-specific averages:
--   SELECT i.BillingCity, ROUND(AVG(i.Total), 2), ROUND(AVG(i.Total), 2) - (SELECT ROUND(AVG(total), 2) FROM Invoice) AS "Difference"
--   FROM Invoice AS i
--   GROUP BY i.BillingCity;
-- - To filter results where the city average exceeds the global average:
--   HAVING AVG(i.Total) > (SELECT AVG(total) FROM Invoice);
