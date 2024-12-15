/*
Topic: Creating a View in SQL

Purpose:
- A **view** is referred to as a virtual table in SQL. It is a saved query that can be reused or referenced like a regular table.
- This example demonstrates creating a view to calculate and store the average invoice total dynamically.

Key Features:
1. **Virtual Table**:
   - A view does not store data; instead, it stores a query that fetches data dynamically from the underlying table(s).
2. **Reusability**:
   - The saved query can be executed repeatedly without rewriting the SQL logic.
3. **Simplification**:
   - Abstracts complex calculations or aggregations, making them reusable in other queries.
4. **Dynamic Updates**:
   - A view reflects changes in the underlying data automatically.

Definitions:
- **CREATE VIEW**: Defines a new view by saving the result of a SQL query.
- **Virtual Table**: A result set that behaves like a table but dynamically pulls data from the database.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This view calculates the average invoice total and allows it to be reused dynamically.
*/

-- Creating a View for Average Invoice Total
CREATE VIEW V_AVGTOTAL AS                -- Defines a view named "V_AVGTOTAL."
SELECT
    ROUND(AVG(total), 2) AS "Average Total" -- Calculates the average total and rounds it to two decimal places.
FROM
    Invoice;                             -- Specifies the Invoice table as the source of the data.

-- Explanation of the SQL Command Above:
-- 1. CREATE VIEW:
--    - Defines a view named `V_AVGTOTAL`.
-- 2. SELECT clause:
--    - Uses the `AVG` function to calculate the average of the `total` column from the `Invoice` table.
--    - Applies the `ROUND` function to format the result to two decimal places.
--    - Renames the resulting column to "Average Total."
-- 3. FROM clause:
--    - Specifies the `Invoice` table as the source for calculating the average.

-- Querying the View:
-- Once the view is created, it can be queried like a regular table:
SELECT * FROM V_AVGTOTAL;

-- Example of Table Structure:

-- Invoice Table:
-- | InvoiceId | Total  |
-- |-----------|--------|
-- | 1         | 150.00 |
-- | 2         | 200.00 |
-- | 3         | 250.00 |

-- After querying the view:
-- | Average Total |
-- |---------------|
-- | 200.00        |

-- Explanation of Results:
-- - The view dynamically calculates the average total using the current data in the `Invoice` table.
-- - If the `Invoice` table is updated, the view reflects the changes automatically.

-- Managing the View:
-- 1. **Updating a View**:
--    - To modify an existing view, use `CREATE OR REPLACE VIEW`:
CREATE OR REPLACE VIEW V_AVGTOTAL AS
SELECT
    ROUND(AVG(total), 2) AS "Average Total"
FROM
    Invoice
WHERE
    InvoiceDate >= '2024-01-01'; -- Filters invoices from 2024 onwards.

-- 2. **Deleting a View**:
--    - To remove a view, use `DROP VIEW`:
DROP VIEW V_AVGTOTAL;

-- Purpose:
-- Views like `V_AVGTOTAL` are useful for:
-- - Simplifying complex calculations and making them reusable.
-- - Dynamically reflecting changes in the underlying data.
-- - Creating consistent, report-ready outputs.

-- Advanced Example:
-- Creating a view that calculates average totals by country:
CREATE VIEW V_AVGTOTAL_BY_COUNTRY AS
SELECT
    BillingCountry AS "Country",
    ROUND(AVG(total), 2) AS "Average Total"
FROM
    Invoice
GROUP BY
    BillingCountry;

-- Querying the Advanced View:
SELECT * FROM V_AVGTOTAL_BY_COUNTRY;

-- Example Output:
-- | Country  | Average Total |
-- |----------|---------------|
-- | USA      | 250.00        |
-- | Canada   | 150.00        |

-- Notes:
-- - Use views to abstract repetitive calculations or aggregations.
-- - Avoid complex logic in views when high performance is required.
-- - Views cannot store data permanently; they always reflect the current state of the underlying tables.
-- - Ensure proper naming conventions (e.g., prefix `V_`) to differentiate views from tables.

-- Alternative Queries:
-- - To include filtering logic in the view:
--   CREATE VIEW V_FILTERED_AVGTOTAL AS
--   SELECT ROUND(AVG(total), 2) AS "Average Total"
--   FROM Invoice
--   WHERE Total > 100;
-- - To display the average total alongside additional metrics:
--   CREATE VIEW V_METRICS AS
--   SELECT
--       ROUND(AVG(total), 2) AS "Average Total",
--       ROUND(SUM(total), 2) AS "Total Sales",
--       COUNT(*) AS "Invoice Count"
--   FROM Invoice;
