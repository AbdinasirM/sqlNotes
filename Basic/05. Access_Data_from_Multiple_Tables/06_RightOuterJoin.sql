/*
Topic: Understanding RIGHT OUTER JOIN with Aliases

RIGHT OUTER JOIN:
- A RIGHT OUTER JOIN (or simply RIGHT JOIN) combines all rows from the right table with matching rows from the left table.
- If there is no match in the left table, the result includes NULL values for the columns from the left table.

Key Features:
- **All Rows from Right Table**: Includes all rows from the right table, regardless of whether there is a matching row in the left table.
- **Unmatched Rows from Left Table as NULL**: Rows from the right table without matches in the left table are included, with NULL values in the left table columns.

Example Scenario:
Imagine a relational database for a music store with the following tables:
1. **Invoice**: Contains information about invoices.
2. **Customer**: Contains customer details.

The relationship:
- The **Invoice** table has a foreign key `CustomerId` that links to the primary key `CustomerId` in the **Customer** table.

Task:
- Retrieve a list of customers and their corresponding invoices.
- Include all customers, even if they do not have any invoices.

Purpose:
To demonstrate how RIGHT OUTER JOIN ensures that all rows from the right table (Customer) are included in the result, even if there is no matching record in the left table (Invoice).
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves all rows from the Customer table and any matching rows from the Invoice table.
If there is no match, the Invoice details will appear as NULL.
*/

-- The SELECT statement retrieves specific columns from the Invoice and Customer tables:
SELECT
    c.LastName AS "Customer Last Name",       -- Retrieves the LastName column from the Customer table and renames it.
    c.FirstName AS "Customer First Name",    -- Retrieves the FirstName column from the Customer table and renames it.
    i.InvoiceId AS "Invoice ID",             -- Retrieves the InvoiceId column from the Invoice table and renames it.
    i.CustomerId AS "Customer ID",           -- Retrieves the CustomerId column from the Invoice table and renames it.
    i.InvoiceDate AS "Invoice Date",         -- Retrieves the InvoiceDate column from the Invoice table and renames it.
    i.Total AS "Total Amount"                -- Retrieves the Total column from the Invoice table and renames it.
FROM
    Invoice AS i                             -- Assigns the alias `i` to the Invoice table.
RIGHT OUTER JOIN
    Customer AS c                            -- Assigns the alias `c` to the Customer table.
ON 
    i.CustomerId = c.CustomerId              -- Matches rows where CustomerId in both tables is the same.
ORDER BY
    c.CustomerId;                            -- Sorts the results by CustomerId in ascending order.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves specific columns from the Customer (alias `c`) and Invoice (alias `i`) tables.
--    - Renames the retrieved columns for better readability in the result set.
-- 2. FROM clause:
--    - Specifies the Invoice table as the secondary data source and assigns it the alias `i`.
-- 3. RIGHT OUTER JOIN:
--    - Combines rows from the Customer (`c`) and Invoice (`i`) tables.
--    - Includes all rows from the Customer table, even if there is no match in the Invoice table.
-- 4. ON clause:
--    - Links the CustomerId column in the Invoice table (`i.CustomerId`) to the CustomerId column in the Customer table (`c.CustomerId`).
--    - Ensures all rows from the Customer table are included, with NULLs for unmatched rows in the Invoice table.
-- 5. ORDER BY clause:
--    - Sorts the results by CustomerId in ascending order using the alias `c`.

-- Example of Table Structures:

-- Invoice Table (alias: i):
-- | InvoiceId | CustomerId | InvoiceDate          | Total  |
-- |-----------|------------|----------------------|--------|
-- | 1         | 101        | 2024-12-10 00:00:00 | 150.00 |
-- | 2         | 102        | 2024-12-11 00:00:00 | 200.00 |

-- Customer Table (alias: c):
-- | CustomerId | LastName     | FirstName  |
-- |------------|--------------|------------|
-- | 101        | Doe          | John       |
-- | 102        | Smith        | Jane       |
-- | 103        | Brown        | Sam        |

-- After applying RIGHT OUTER JOIN:
-- | Customer Last Name | Customer First Name | Invoice ID | Customer ID | Invoice Date          | Total Amount |
-- |--------------------|---------------------|------------|-------------|-----------------------|--------------|
-- | Doe                | John                | 1          | 101         | 2024-12-10 00:00:00  | 150.00       |
-- | Smith              | Jane                | 2          | 102         | 2024-12-11 00:00:00  | 200.00       |
-- | Brown              | Sam                 | NULL       | 103         | NULL                 | NULL         |

-- Explanation of Results:
-- - Customers with matching invoices (CustomerId 101 and 102) retrieve invoice details.
-- - The customer with CustomerId 103 has no matching invoice, so the Invoice columns appear as NULL.

-- Purpose:
-- This query demonstrates how RIGHT OUTER JOIN ensures that all rows from the right table (Customer) are included in the result, even if there is no match in the left table (Invoice).
-- It is useful for:
-- - Generating comprehensive customer reports that include all customers, even those without invoices.
-- - Identifying customers who have not made any purchases.

-- Notes:
-- - RIGHT OUTER JOIN includes unmatched rows from the right table (Customer) with NULLs for the left table (Invoice).
-- - If only matching rows are needed, use INNER JOIN instead.
-- - If all invoices should be included along with their customers (even if no customer exists), use LEFT OUTER JOIN.

-- Alternative Queries:
-- - To filter results where no matching invoice exists:
--   SELECT ...
--   WHERE i.InvoiceId IS NULL
--   ORDER BY c.CustomerId;
-- - To include all customers and count their invoices:
--   SELECT c.CustomerId, COUNT(i.InvoiceId) AS InvoiceCount
--   FROM Customer AS c
--   RIGHT OUTER JOIN Invoice AS i ON c.CustomerId = i.CustomerId
--   GROUP BY c.CustomerId;
