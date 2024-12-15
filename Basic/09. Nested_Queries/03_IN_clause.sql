/*
Topic: Using the IN Clause with Subqueries

Purpose:
- This query demonstrates how to use the `IN` clause to filter rows based on the results of a subquery.
- The `IN` clause checks whether a value exists within a set of values returned by a subquery or specified manually.

Key Features:
1. **Filtering with IN**:
   - The `IN` clause is used to match values in the main query against a list of values returned by the subquery.
   - It allows filtering rows dynamically based on the subquery results.
2. **Subqueries**:
   - A subquery is nested within the `WHERE` clause to calculate intermediate results.
   - Subqueries in this example operate on the `Invoice` table.
3. **Dynamic Filtering**:
   - The query dynamically filters invoices where the `InvoiceDate` matches the dates associated with specific `InvoiceId` values.

Definitions:
- **IN Clause**: A SQL operator that checks if a value exists within a set of values.
- **Subquery**: A query embedded within another query, used to compute values or criteria for the outer query.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves invoices based on matching invoice dates derived from specific invoice IDs.
*/

-- Query Explanation:
SELECT
    InvoiceDate,                            -- Retrieves the invoice date.
    BillingAddress,                         -- Retrieves the billing address.
    BillingCity                             -- Retrieves the billing city.
FROM
    Invoice                                 -- Specifies the Invoice table as the data source.
WHERE
    InvoiceDate IN (                        -- Filters rows where the invoice date matches those returned by the subquery.
        SELECT
            InvoiceDate                    -- Retrieves invoice dates from the Invoice table.
        FROM
            Invoice
        WHERE
            InvoiceId IN (251, 252, 254)   -- Filters rows where the InvoiceId is 251, 252, or 254.
    );

-- Explanation of the SQL command above:
-- 1. SELECT clause (Outer Query):
--    - Retrieves `InvoiceDate`, `BillingAddress`, and `BillingCity` for invoices that meet the filtering criteria.
-- 2. WHERE clause (Outer Query):
--    - Uses the `IN` operator to filter rows where `InvoiceDate` matches dates returned by the subquery.
-- 3. Subquery 1:
--    - Retrieves `InvoiceDate` for invoices where `InvoiceId` is 251, 252, or 254.
--    - The `InvoiceId IN (251, 252, 254)` condition ensures only rows with these specific IDs are included.
-- 4. Execution Flow:
--    - The inner query first identifies the `InvoiceDate` values for `InvoiceId` 251, 252, and 254.
--    - The outer query uses these dates to filter rows in the `Invoice` table.

-- Example of Table Structure:

-- Invoice Table:
-- | InvoiceId | InvoiceDate  | BillingAddress      | BillingCity  |
-- |-----------|--------------|---------------------|--------------|
-- | 251       | 2024-01-01   | 123 Main St         | New York     |
-- | 252       | 2024-01-02   | 456 Oak St          | Los Angeles  |
-- | 253       | 2024-01-03   | 789 Pine Ave        | Chicago      |
-- | 254       | 2024-01-01   | 321 Elm St          | Boston       |

-- After applying the query:
-- | InvoiceDate | BillingAddress      | BillingCity  |
-- |-------------|---------------------|--------------|
-- | 2024-01-01  | 123 Main St         | New York     |
-- | 2024-01-01  | 321 Elm St          | Boston       |
-- | 2024-01-02  | 456 Oak St          | Los Angeles  |

-- Explanation of Results:
-- - The inner query identifies `InvoiceDate` values for `InvoiceId` 251, 252, and 254:
--   - InvoiceId 251: 2024-01-01
--   - InvoiceId 252: 2024-01-02
--   - InvoiceId 254: 2024-01-01
-- - The outer query filters rows in the `Invoice` table where `InvoiceDate` matches any of these dates.

-- Purpose:
-- This query is useful for:
-- - Identifying invoices based on dates associated with specific invoice IDs.
-- - Dynamically filtering rows based on criteria derived from a subquery.
-- - Generating reports or performing analyses for specific subsets of data.

-- Notes:
-- - Ensure that the subquery returns a single column to be compatible with the `IN` operator.
-- - The `IN` clause can also work with manually provided lists, such as `IN ('2024-01-01', '2024-01-02')`.

-- Alternative Queries:
-- - To filter rows directly by `InvoiceId` without using dates:
--   SELECT InvoiceDate, BillingAddress, BillingCity
--   FROM Invoice
--   WHERE InvoiceId IN (251, 252, 254);
-- - To retrieve invoices with totals exceeding a threshold for these specific IDs:
--   SELECT InvoiceDate, BillingAddress, BillingCity, Total
--   FROM Invoice
--   WHERE InvoiceId IN (251, 252, 254) AND Total > 100;
-- - To list invoices grouped by date for specific IDs:
--   SELECT InvoiceDate, COUNT(*) AS "Invoice Count"
--   FROM Invoice
--   WHERE InvoiceId IN (251, 252, 254)
--   GROUP BY InvoiceDate;
