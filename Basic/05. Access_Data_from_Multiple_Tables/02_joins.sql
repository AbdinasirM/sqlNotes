/*
Topic: Understanding INNER JOIN

INNER JOIN:
- The INNER JOIN clause is used to combine rows from two or more tables based on a related column between them.
- It retrieves only the rows where there is a match in both tables.

Example Scenario:
Imagine a relational database for a music store with the following tables:
1. **Invoice**: Contains information about invoices.
2. **Customer**: Contains customer details.

The relationship:
- The **Invoice** table has a foreign key `CustomerId` that links to the primary key `CustomerId` in the **Customer** table.

Task:
- Write an SQL query to retrieve all data from the `Invoice` and `Customer` tables by matching the `CustomerId` column in both tables.
- Sort the results by `Customer.CustomerId` in ascending order.

Purpose:
To demonstrate how an INNER JOIN connects two tables and retrieves combined data where matches exist.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves all columns from the Invoice and Customer tables where the CustomerId matches in both tables,
and sorts the results by CustomerId.
*/

-- The SELECT statement retrieves all columns from the Invoice and Customer tables:
SELECT
    *                                          -- Retrieves all columns from both tables.
FROM
    Invoice                                    -- Specifies the Invoice table as the first data source.
INNER JOIN
    Customer                                   -- Specifies the Customer table to be joined.
ON 
    Invoice.CustomerId = Customer.CustomerId  -- Matches rows where CustomerId is the same in both tables.
ORDER BY
    Customer.CustomerId;                      -- Sorts the results by Customer.CustomerId in ascending order.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - The `*` wildcard retrieves all columns from both the Invoice and Customer tables.
-- 2. FROM clause:
--    - Specifies the Invoice table as the primary data source.
-- 3. INNER JOIN:
--    - Combines rows from the Invoice and Customer tables where the `CustomerId` in both tables match.
--    - Only rows with matching `CustomerId` values in both tables are included in the result.
-- 4. ON clause:
--    - Specifies the condition for the join: `Invoice.CustomerId = Customer.CustomerId`.
--    - Links the `CustomerId` column in the Invoice table (foreign key) to the `CustomerId` column in the Customer table (primary key).
-- 5. ORDER BY clause:
--    - Ensures the results are sorted by CustomerId in ascending order.

-- Example of Table Structures:

-- Invoice Table:
-- | InvoiceId | CustomerId | InvoiceDate          | Total  |
-- |-----------|------------|----------------------|--------|
-- | 1         | 101        | 2024-12-10 00:00:00 | 50.00  |
-- | 2         | 102        | 2024-12-11 00:00:00 | 75.00  |
-- | 3         | 103        | 2024-12-12 00:00:00 | 100.00 |

-- Customer Table:
-- | CustomerId | CustomerName      | City        |
-- |------------|-------------------|-------------|
-- | 101        | John Doe          | New York    |
-- | 102        | Jane Smith        | Boston      |
-- | 103        | Sam Brown         | Chicago     |

-- After applying the INNER JOIN:
-- | InvoiceId | CustomerId | InvoiceDate          | Total  | CustomerName  | City      |
-- |-----------|------------|----------------------|--------|---------------|-----------|
-- | 1         | 101        | 2024-12-10 00:00:00 | 50.00  | John Doe      | New York  |
-- | 2         | 102        | 2024-12-11 00:00:00 | 75.00  | Jane Smith    | Boston    |
-- | 3         | 103        | 2024-12-12 00:00:00 | 100.00 | Sam Brown     | Chicago   |

-- Purpose:
-- This query demonstrates how to use INNER JOIN to combine data from related tables in a relational database. 
-- It is useful for scenarios like:
-- - Analyzing customer purchase history.
-- - Generating reports that combine invoice and customer details.

-- Notes:
-- - INNER JOIN excludes rows that do not have matching values in both tables.
-- - If you need all rows from one table regardless of matches in the other, consider using LEFT JOIN or RIGHT JOIN instead.
-- - Use explicit column names in the SELECT clause instead of `*` for better performance and clarity in production queries.

-- Alternative Queries:
-- - To include only specific columns:
--   SELECT Invoice.InvoiceId, Customer.CustomerName, Invoice.Total
--   FROM Invoice
--   INNER JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
--   ORDER BY Customer.CustomerId;
