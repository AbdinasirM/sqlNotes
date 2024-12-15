/*
Topic: Multi-Table INNER JOIN with Sorting and Limiting Results

Purpose:
- This query retrieves the top 10 invoices with the highest total amounts.
- It combines data from three tables: Invoice, Customer, and Employee.
- The query shows the details of employees who served as support representatives for customers associated with the invoices.

Key Features:
1. **Multi-Table INNER JOIN**: Combines data from three related tables.
2. **Sorting**: Orders the results by the `Total` column in descending order (highest to lowest).
3. **LIMIT Clause**: Restricts the result set to the top 10 invoices based on their total amounts.

Example Scenario:
Imagine a relational database for a music store with the following tables:
1. **Invoice**: Contains details of all invoices.
2. **Customer**: Contains customer details, including their assigned support representative (SupportRepId).
3. **Employee**: Contains employee details, including support representatives who assist customers.

Relationships:
- The **Invoice** table has a foreign key `CustomerId` that links to the primary key `CustomerId` in the **Customer** table.
- The **Customer** table has a foreign key `SupportRepId` that links to the primary key `EmployeeId` in the **Employee** table.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves the top 10 invoices with the highest total amounts, along with customer details and their support representative information.
*/

-- The SELECT statement retrieves specific columns from the Employee, Customer, and Invoice tables:
SELECT
    e.FirstName AS "Employee First Name",   -- Retrieves the FirstName of the support representative and renames it.
    e.LastName AS "Employee Last Name",    -- Retrieves the LastName of the support representative and renames it.
    e.EmployeeId AS "Employee ID",         -- Retrieves the EmployeeId of the support representative and renames it.
    c.FirstName AS "Customer First Name",  -- Retrieves the FirstName of the customer and renames it.
    c.LastName AS "Customer Last Name",    -- Retrieves the LastName of the customer and renames it.
    c.SupportRepId AS "Support Rep ID",    -- Retrieves the SupportRepId from the Customer table and renames it.
    i.Total AS "Invoice Total"             -- Retrieves the Total amount of the invoice and renames it.
FROM 
    Invoice AS i                           -- Assigns the alias `i` to the Invoice table.
INNER JOIN
    Customer AS c                          -- Assigns the alias `c` to the Customer table.
ON 
    i.CustomerId = c.CustomerId            -- Matches rows where CustomerId in Invoice matches CustomerId in Customer.
INNER JOIN
    Employee AS e                          -- Assigns the alias `e` to the Employee table.
ON 
    c.SupportRepId = e.EmployeeId          -- Matches rows where SupportRepId in Customer matches EmployeeId in Employee.
ORDER BY 
    i.Total DESC                           -- Sorts the results by the Total column in descending order (highest to lowest).
LIMIT 10;                                  -- Restricts the result set to the top 10 rows.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves specific columns from the Employee (alias `e`), Customer (alias `c`), and Invoice (alias `i`) tables.
--    - Renames the columns for better readability in the result set.
-- 2. FROM clause:
--    - Specifies the Invoice table as the primary data source and assigns it the alias `i`.
-- 3. INNER JOINs:
--    - First INNER JOIN:
--      Matches rows in the Invoice table (`i.CustomerId`) with rows in the Customer table (`c.CustomerId`).
--    - Second INNER JOIN:
--      Matches rows in the Customer table (`c.SupportRepId`) with rows in the Employee table (`e.EmployeeId`).
--    - Ensures only rows with matching values in all three tables are included in the result.
-- 4. ORDER BY clause:
--    - Sorts the results by the `Total` column in descending order, so invoices with the highest totals appear first.
-- 5. LIMIT clause:
--    - Restricts the result set to the top 10 invoices with the highest totals.

-- Example of Table Structures:

-- Invoice Table (alias: i):
-- | InvoiceId | CustomerId | InvoiceDate          | Total  |
-- |-----------|------------|----------------------|--------|
-- | 1         | 101        | 2024-12-10 00:00:00 | 150.00 |
-- | 2         | 102        | 2024-12-11 00:00:00 | 200.00 |

-- Customer Table (alias: c):
-- | CustomerId | FirstName | LastName  | SupportRepId |
-- |------------|-----------|-----------|--------------|
-- | 101        | John      | Doe       | 1            |
-- | 102        | Jane      | Smith     | 2            |

-- Employee Table (alias: e):
-- | EmployeeId | FirstName | LastName  |
-- |------------|-----------|-----------|
-- | 1          | Sam       | Brown     |
-- | 2          | Lisa      | Taylor    |

-- After applying the INNER JOINs and sorting:
-- | Employee First Name | Employee Last Name | Employee ID | Customer First Name | Customer Last Name | Support Rep ID | Invoice Total |
-- |---------------------|--------------------|-------------|---------------------|--------------------|----------------|---------------|
-- | Lisa                | Taylor            | 2           | Jane                | Smith             | 2              | 200.00        |
-- | Sam                 | Brown             | 1           | John                | Doe               | 1              | 150.00        |

-- Explanation of Results:
-- - The query combines data from all three tables to retrieve the top 10 invoices with the highest total amounts.
-- - For each invoice, it includes customer details and the support representative who assisted the customer.

-- Purpose:
-- This query is useful for:
-- - Identifying high-value invoices and their associated customers and support representatives.
-- - Analyzing customer service efficiency by connecting invoices to support representatives.
-- - Generating reports to focus on high-value transactions.

-- Notes:
-- - INNER JOIN ensures only matching rows from the Invoice, Customer, and Employee tables are included in the result.
-- - The LIMIT clause optimizes performance by restricting the result set to the top 10 rows.

-- Alternative Queries:
-- - To include invoices regardless of whether a customer or support representative exists, use LEFT OUTER JOIN instead of INNER JOIN.
-- - To analyze totals for specific employees:
--   WHERE e.EmployeeId = 1
--   ORDER BY i.Total DESC;
