/*
Topic: Aggregating Sales Data to Get All-Time Sales

Purpose:
- This query calculates aggregate statistics on sales from the `Invoice` table.
- It provides the total, average, minimum, maximum, and count of all sales, summarizing the data into a single result.

Key Features:
1. **Aggregation**:
   - Uses aggregate functions to compute statistics on the `total` column in the `Invoice` table.
   - Aggregate functions summarize a range of numbers into a single point of data.
2. **Result Formatting**:
   - Renames each result column for clarity and presentation in reports.

Definitions:
- **SUM**: Calculates the total sum of a numeric column.
- **AVG**: Computes the average value of a numeric column.
- **MIN**: Finds the smallest value in a numeric column.
- **MAX**: Finds the largest value in a numeric column.
- **COUNT**: Counts the number of rows in the dataset.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query aggregates sales data from the Invoice table to calculate total, average, minimum, maximum, and count of sales.
*/

-- The SELECT statement retrieves aggregated sales data using aggregate functions:
SELECT
    SUM(total) AS "Total Sale",          -- Calculates the total sum of all sales.
    AVG(total) AS "Average Sale",        -- Computes the average value of all sales.
    MIN(total) AS "Minimum Sale",        -- Finds the smallest sale amount.
    MAX(total) AS "Maximum Sale",        -- Finds the largest sale amount.
    COUNT(*) AS "Sales Count"            -- Counts the total number of sales (invoices).
FROM 
    Invoice                              -- Specifies the Invoice table as the data source.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Applies aggregate functions to the `total` column from the `Invoice` table:
--      a) `SUM(total)`: Adds up all values in the `total` column to calculate the total sales.
--      b) `AVG(total)`: Computes the average of all values in the `total` column.
--      c) `MIN(total)`: Finds the smallest value in the `total` column.
--      d) `MAX(total)`: Finds the largest value in the `total` column.
--    - `COUNT(*)`: Counts the total number of rows in the `Invoice` table, representing the number of sales.
--    - Renames the result columns using aliases (e.g., "Total Sale," "Average Sale").
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
-- | Total Sale | Average Sale | Minimum Sale | Maximum Sale | Sales Count |
-- |------------|--------------|--------------|--------------|-------------|
-- | 600.00     | 200.00       | 150.00       | 250.00       | 3           |

-- Explanation of Results:
-- - `Total Sale`: Adds up all invoice totals (150.00 + 200.00 + 250.00 = 600.00).
-- - `Average Sale`: Divides the total sales by the number of invoices (600.00 / 3 = 200.00).
-- - `Minimum Sale`: Finds the smallest sale value (150.00).
-- - `Maximum Sale`: Finds the largest sale value (250.00).
-- - `Sales Count`: Counts the number of rows (invoices) in the `Invoice` table (3).

-- Purpose:
-- This query is useful for:
-- - Generating summary statistics for sales data.
-- - Analyzing key performance metrics, such as average and maximum sales.
-- - Creating reports for business insights or financial analysis.

-- Notes:
-- - Ensure that the `total` column contains valid numeric data to avoid errors in aggregation.
-- - Aggregate functions operate on the entire dataset unless grouped or filtered using `GROUP BY` or `WHERE` clauses.

-- Alternative Queries:
-- - To calculate aggregates for a specific time period, add a `WHERE` clause:
--   WHERE InvoiceDate BETWEEN '2024-01-01' AND '2024-12-31';
-- - To group aggregates by customer:
--   SELECT CustomerId, SUM(total) AS "Total Sale", COUNT(*) AS "Sales Count"
--   FROM Invoice
--   GROUP BY CustomerId;
-- - To find the largest sale for each customer:
--   SELECT CustomerId, MAX(total) AS "Maximum Sale"
--   FROM Invoice
--   GROUP BY CustomerId;
