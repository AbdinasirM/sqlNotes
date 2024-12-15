/*
Topic: Understanding INNER JOIN with Aliases

INNER JOIN:
- The INNER JOIN clause is used to combine rows from two or more tables based on a related column between them.
- It retrieves only the rows where there is a match in both tables.

Aliases:
- Aliases are used to assign short names to table names or columns for easier reference, especially in queries involving multiple tables.
- In this query, aliases `i` and `c` are used for the `Invoice` and `Customer` tables, respectively.

Task:
- Write an SQL query to retrieve specific columns from the `Invoice` and `Customer` tables by matching the `CustomerId` column in both tables.
- Sort the results by `CustomerId` in ascending order.

Purpose:
To demonstrate how aliases simplify queries by making table references concise and readable.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves specific columns from the Invoice and Customer tables using aliases, 
and matches rows where CustomerId is the same in both tables.
*/

-- The SELECT statement retrieves specific columns using aliases for the tables:
SELECT
    c.LastName AS "Customer Last Name", -- Retrieves the LastName column from the Customer table and renames it.
    c.FirstName AS "Customer First Name", -- Retrieves the FirstName column from the Customer table and renames it.
    i.InvoiceId AS "Invoice ID",        -- Retrieves the InvoiceId column from the Invoice table and renames it.
    i.CustomerId AS "Customer ID",      -- Retrieves the CustomerId column from the Invoice table and renames it.
    i.InvoiceDate AS "Invoice Date",    -- Retrieves the InvoiceDate column from the Invoice table and renames it.
    i.Total AS "Total Amount"           -- Retrieves the Total column from the Invoice table and renames it.
FROM
    Invoice AS i                        -- Assigns the alias `i` to the Invoice table.
INNER JOIN
    Customer AS c                       -- Assigns the alias `c` to the Customer table.
ON 
    i.CustomerId = c.CustomerId         -- Matches rows where CustomerId in both tables is the same.
ORDER BY
    c.CustomerId;                       -- Sorts the results by CustomerId in ascending order.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves specific columns from the Customer (alias `c`) and Invoice (alias `i`) tables.
--    - Renames the retrieved columns for better readability in the result set.
-- 2. FROM clause:
--    - Specifies the Invoice table as the primary data source and assigns it the alias `i`.
-- 3. INNER JOIN:
--    - Combines rows from the Invoice (`i`) and Customer (`c`) tables based on the condition defined in the ON clause.
-- 4. ON clause:
--    - Links the CustomerId column in the Invoice table (`i.CustomerId`) to the CustomerId column in the Customer table (`c.CustomerId`).
--    - Ensures only rows with matching CustomerId values in both tables are included in the result.
-- 5. ORDER BY clause:
--    - Sorts the results by CustomerId in ascending order using the alias `c`.

-- Example of Table Structures:

-- Invoice Table (alias: i):
-- | InvoiceId | CustomerId | InvoiceDate          | Total  |
-- |-----------|------------|----------------------|--------|
-- | 1         | 101        | 2024-12-10 00:00:00 | 50.00  |
-- | 2         | 102        | 2024-12-11 00:00:00 | 75.00  |
-- | 3         | 103        | 2024-12-12 00:00:00 | 100.00 |

-- Customer Table (alias: c):
-- | CustomerId | LastName     | FirstName  |
-- |------------|--------------|------------|
-- | 101        | Doe          | John       |
-- | 102        | Smith        | Jane       |
-- | 103        | Brown        | Sam        |

-- After applying the INNER JOIN:
-- | Customer Last Name | Customer First Name | Invoice ID | Customer ID | Invoice Date          | Total Amount |
-- |--------------------|---------------------|------------|-------------|-----------------------|--------------|
-- | Doe                | John                | 1          | 101         | 2024-12-10 00:00:00  | 50.00        |
-- | Smith              | Jane                | 2          | 102         | 2024-12-11 00:00:00  | 75.00        |
-- | Brown              | Sam                 | 3          | 103         | 2024-12-12 00:00:00  | 100.00       |

-- Purpose:
-- This query demonstrates the use of aliases to simplify table references in a query while maintaining clarity.
-- It retrieves combined data from the Invoice and Customer tables, sorted by CustomerId.

-- Notes:
-- - Aliases reduce repetition and make the query more concise, especially in cases with multiple tables or long table names.
-- - INNER JOIN ensures that only rows with matching values in both tables are included in the result.
-- - Using aliases is optional but recommended for readability and maintainability.

-- Alternative Queries:
-- - To include only invoices with totals greater than $50:
--   SELECT ...
--   WHERE i.Total > 50
--   ORDER BY c.CustomerId;
-- - To count the number of invoices per customer:
--   SELECT c.CustomerId, COUNT(i.InvoiceId) AS InvoiceCount
--   FROM Invoice AS i
--   INNER JOIN Customer AS c ON i.CustomerId = c.CustomerId
--   GROUP BY c.CustomerId;
