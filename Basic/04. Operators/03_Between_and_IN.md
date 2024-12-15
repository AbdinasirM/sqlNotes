/*
Task: Retrieve and display invoice details based on specified conditions for the total amount.
Queries:
1. List invoices where the total is between 1.98 and 5.00.
2. List invoices where the total is exactly 1.98 or 3.96.
Result:
- A list of invoices sorted by invoice date in ascending order (default).
Purpose:
To generate reports for invoices meeting specific criteria, organized chronologically for easier analysis.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: These queries retrieve invoice details based on total amount conditions and sort them by invoice date.
*/

-- Query 1: Retrieve invoices where the total is between 1.98 and 5.00:
SELECT
    InvoiceDate,              -- The date the invoice was generated.
    BillingAddress,           -- The customer's billing address.
    BillingCity,              -- The city associated with the billing address.
    Total                     -- The total amount of the invoice.
FROM 
    Invoice                   -- Specifies the Invoice table as the data source.
WHERE  
    Total BETWEEN 1.98 AND 5.00  -- Filters results to include totals in the range [1.98, 5.00].
ORDER BY 
    InvoiceDate;              -- Sorts the results by InvoiceDate in ascending order.

-- Explanation of Query 1:
-- 1. SELECT clause:
--    - Retrieves the InvoiceDate, BillingAddress, BillingCity, and Total columns.
-- 2. FROM clause:
--    - Data is fetched from the Invoice table.
-- 3. WHERE clause:
--    - The BETWEEN operator filters rows where the Total is between 1.98 and 5.00, inclusive.
--    - This means invoices with totals of 1.98, 2.00, 3.50, etc., up to 5.00 are included.
-- 4. ORDER BY clause:
--    - Ensures the results are sorted by InvoiceDate from earliest to latest.

-- Example of results for Query 1:
-- | InvoiceDate | BillingAddress  | BillingCity | Total |
-- |-------------|-----------------|-------------|-------|
-- | 2024-12-10  | 123 Main St     | New York    | 2.50  |
-- | 2024-12-11  | 456 Elm St      | Boston      | 4.75  |
-- | 2024-12-12  | 789 Oak St      | Chicago     | 3.00  |
-- | 2024-12-13  | 321 Maple St    | Seattle     | 1.98  |

-- Query 2: Retrieve invoices where the total is exactly 1.98 or 3.96:
SELECT
    InvoiceDate,              -- The date the invoice was generated.
    BillingAddress,           -- The customer's billing address.
    BillingCity,              -- The city associated with the billing address.
    Total                     -- The total amount of the invoice.
FROM 
    Invoice                   -- Specifies the Invoice table as the data source.
WHERE  
    Total IN (1.98, 3.96)     -- Filters results to include only totals of 1.98 or 3.96.
ORDER BY 
    InvoiceDate;              -- Sorts the results by InvoiceDate in ascending order.

-- Explanation of Query 2:
-- 1. SELECT clause:
--    - Retrieves the InvoiceDate, BillingAddress, BillingCity, and Total columns.
-- 2. FROM clause:
--    - Data is fetched from the Invoice table.
-- 3. WHERE clause:
--    - The IN operator filters rows where the Total matches one of the specified values (1.98 or 3.96).
--    - This is equivalent to using `Total = 1.98 OR Total = 3.96`.
-- 4. ORDER BY clause:
--    - Ensures the results are sorted by InvoiceDate from earliest to latest.

-- Example of results for Query 2:
-- | InvoiceDate | BillingAddress  | BillingCity | Total |
-- |-------------|-----------------|-------------|-------|
-- | 2024-12-10  | 123 Main St     | New York    | 1.98  |
-- | 2024-12-12  | 789 Oak St      | Chicago     | 3.96  |

-- Purpose of Queries:
-- - Query 1 identifies invoices with totals within a range, useful for reporting or filtering transactions by thresholds.
-- - Query 2 retrieves invoices with specific total amounts, useful for pinpointing exact transactions.

-- Notes:
-- - The BETWEEN operator includes both boundary values (1.98 and 5.00 in Query 1).
-- - The IN operator provides a simple way to match multiple exact values (1.98 and 3.96 in Query 2).
-- - ORDER BY ensures the results are chronologically organized, making the data easier to analyze.
