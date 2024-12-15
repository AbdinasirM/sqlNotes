/*
Topic: Using Nested Functions to Summarize Sales Data

Purpose:
- This query calculates the total sales and rounds the average sales value using nested functions.
- It demonstrates the use of one function inside another (nesting functions) to perform combined operations.

Key Features:
1. **Nesting Functions**:
   - Nesting involves using one function as an argument within another function.
   - In this query, the `ROUND` function is applied to the result of the `AVG` function to round the average sales value to the nearest whole number.
2. **Aggregation**:
   - Uses aggregate functions (`SUM` and `AVG`) to summarize the `total` column.
3. **Result Formatting**:
   - Renames each result column for clarity and presentation.

Definitions:
- **SUM**: Calculates the total sum of a numeric column.
- **AVG**: Computes the average value of a numeric column.
- **ROUND**: Rounds a numeric value to the specified number of decimal places (default is 0).

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query calculates the total and average sales, rounding the average to the nearest whole number.
*/

-- The SELECT statement calculates total and average sales using aggregate functions and nesting:
SELECT
    SUM(total) AS "Total Sale",           -- Calculates the total sum of all sales and renames the column.
    ROUND(AVG(total)) AS "Average Sale"   -- Computes the average sales and rounds it to the nearest whole number.
FROM 
    Invoice                               -- Specifies the Invoice table as the data source.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Applies aggregate functions to the `total` column from the `Invoice` table:
--      a) `SUM(total)`: Adds up all values in the `total` column to calculate the total sales.
--      b) `AVG(total)`: Computes the average of all values in the `total` column.
--      c) `ROUND(AVG(total))`: Rounds the average sales to the nearest whole number.
--        - Example:
--          AVG(total) = 203.67
--          ROUND(AVG(total)) = 204
-- 2. FROM clause:
--    - Specifies the Invoice table as the source of the sales data.

-- Example of Table Structure:

-- Invoice Table:
-- | InvoiceId | CustomerId | InvoiceDate          | Total  |
-- |-----------|------------|----------------------|--------|
-- | 1         | 101        | 2024-12-10 00:00:00 | 150.00 |
-- | 2         | 102        | 2024-12-11 00:00:00 | 200.00 |
-- | 3         | 103        | 2024-12-12 00:00:00 | 250.00 |

-- After applying the query:
-- | Total Sale | Average Sale |
-- |------------|--------------|
-- | 600.00     | 200          |

-- Explanation of Results:
-- - `Total Sale`: Adds up all invoice totals (150.00 + 200.00 + 250.00 = 600.00).
-- - `Average Sale`: Computes the average (600.00 / 3 = 200.00) and rounds it to the nearest whole number (200).

-- Purpose:
-- This query is useful for:
-- - Generating summary statistics for sales data.
-- - Presenting rounded averages for easier interpretation in reports.
-- - Analyzing sales trends by calculating total and average sales.

-- Notes:
-- - Ensure that the `ROUND` function is supported by your SQL implementation.
--   - In some databases (e.g., MySQL), `ROUND` takes an additional argument for the number of decimal places:
--     Example: ROUND(AVG(total), 2) to round to two decimal places.
-- - Nested functions allow combining operations in a single query, simplifying the result calculation.

-- Alternative Queries:
-- - To include only sales within a specific date range:
--   WHERE InvoiceDate BETWEEN '2024-01-01' AND '2024-12-31';
-- - To group sales data by customer and round their averages:
--   SELECT CustomerId, ROUND(AVG(total)) AS "Average Sale"
--   FROM Invoice
--   GROUP BY CustomerId;
-- - To display averages rounded to two decimal places:
--   ROUND(AVG(total), 2) AS "Average Sale";
