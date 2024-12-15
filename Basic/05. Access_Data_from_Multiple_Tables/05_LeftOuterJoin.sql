/*
Topic: Understanding LEFT OUTER JOIN with Aliases

LEFT OUTER JOIN:
- A LEFT OUTER JOIN (or simply LEFT JOIN) combines all rows from the left table with matching rows from the right table.
- If there is no match in the right table, the result includes NULL values for the columns from the right table.

Key Features:
- Includes **all rows** from the left table, regardless of whether there is a matching row in the right table.
- Any unmatched rows in the right table will appear as NULL in the result.

Example Scenario:
Imagine a relational database for a music store with the following tables:
1. **Invoice**: Contains information about invoices.
2. **Customer**: Contains customer details.

The relationship:
- The **Invoice** table has a foreign key `CustomerId` that links to the primary key `CustomerId` in the **Customer** table.

Task:
- Retrieve a list of invoices and their corresponding customer details.
- If a customer record is not found for an invoice, include the invoice with NULL values for the customer details.

Purpose:
To demonstrate how LEFT OUTER JOIN ensures that all rows from the left table (Invoice) are included in the result, even if there is no matching record in the right table (Customer).
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves all rows from the Invoice table and any matching rows from the Customer table.
If there is no match, the Customer details will appear as NULL.
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
LEFT OUTER JOIN
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
--    - Specifies the Invoice table as the primary data source and assigns it the alias `i`.
-- 3. LEFT OUTER JOIN:
--    - Combines rows from the Invoice (`i`) and Customer (`c`) tables.
--    - Includes all rows from the Invoice table, even if there is no match in the Customer table.
-- 4. ON clause:
--    - Links the CustomerId column in the Invoice table (`i.CustomerId`) to the CustomerId column in the Customer table (`c.CustomerId`).
--    - Ensures matching rows from the Customer table are included when possible.
-- 5. ORDER BY clause:
--    - Sorts the results by CustomerId in ascending order using the alias `c`.

-- Example of Table Structures:

-- Invoice Table (alias: i):
-- | InvoiceId | CustomerId | InvoiceDate          | Total  |
-- |-----------|------------|----------------------|--------|
-- | 1         | 101        | 2024-12-10 00:00:00 | 150.00 |
-- | 2         | 102        | 2024-12-11 00:00:00 | 200.00 |
-- | 3         | 104        | 2024-12-12 00:00:00 | 250.00 |

-- Customer Table (alias: c):
-- | CustomerId | LastName     | FirstName  |
-- |------------|--------------|------------|
-- | 101        | Doe          | John       |
-- | 102        | Smith        | Jane       |
-- | 103        | Brown        | Sam        |

-- After applying LEFT OUTER JOIN:
-- | Customer Last Name | Customer First Name | Invoice ID | Customer ID | Invoice Date          | Total Amount |
-- |--------------------|---------------------|------------|-------------|-----------------------|--------------|
-- | Doe                | John                | 1          | 101         | 2024-12-10 00:00:00  | 150.00       |
-- | Smith              | Jane                | 2          | 102         | 2024-12-11 00:00:00  | 200.00       |
-- | NULL               | NULL                | 3          | 104         | 2024-12-12 00:00:00  | 250.00       |

-- Explanation of Results:
-- - Invoices with matching CustomerId (101 and 102) retrieve customer details.
-- - Invoice with CustomerId 104 has no matching customer record, so the customer details appear as NULL.

-- Purpose:
-- This query demonstrates how LEFT OUTER JOIN includes all rows from the left table (Invoice) and fills NULL values for missing matches in the right table (Customer).
-- It is useful for:
-- - Generating comprehensive reports that include all rows from the main table.
-- - Identifying rows in the left table without corresponding entries in the right table.

-- Notes:
-- - LEFT OUTER JOIN includes unmatched rows from the left table (Invoice) with NULLs for the right table (Customer).
-- - If only matching rows are needed, use INNER JOIN instead.

-- Alternative Queries:
-- - To filter results where no matching customer exists:
--   SELECT ...
--   WHERE c.CustomerId IS NULL
--   ORDER BY i.CustomerId;
-- - To include all customers and their invoices (even if they have no invoices), use RIGHT OUTER JOIN.
