/*
Task: Retrieve and display invoice details where the invoice date is after "2010-05-22" 
and the total amount is less than 3.00.
Result:
- A list of invoices matching the specified criteria, sorted by the invoice date in ascending order.

Purpose:
To generate a report of invoices issued after a specific date with a total amount below a defined threshold.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves invoice details for invoices issued after "2010-05-22"
with a total amount less than 3.00, and sorts the results by invoice date.
*/

-- The SELECT statement retrieves the specified columns from the Invoice table:
SELECT
    InvoiceDate,              -- The date and time the invoice was generated.
    BillingAddress,           -- The customer's billing address.
    BillingCity,              -- The city associated with the billing address.
    Total                     -- The total amount of the invoice.
FROM 
    Invoice                   -- Specifies the Invoice table as the data source.
WHERE  
    DATE(InvoiceDate) > "2010-05-22"  -- Filters results for invoices issued after "2010-05-22."
    AND Total < 3.00                  -- Further filters results to include only invoices with a total amount less than 3.00.
ORDER BY 
    InvoiceDate;              -- Sorts the results by InvoiceDate in ascending order.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves four columns from the Invoice table:
--      a) InvoiceDate: The date and time the invoice was issued.
--      b) BillingAddress: The customer's billing address.
--      c) BillingCity: The city associated with the billing address.
--      d) Total: The total amount of the invoice.
-- 2. FROM clause:
--    - Specifies the Invoice table as the source of the data.
-- 3. WHERE clause:
--    - The DATE() function extracts the date portion (ignoring time) of the InvoiceDate column.
--    - Filters for rows where the date is after "2010-05-22."
--    - Adds a second condition using `AND` to include only rows where the Total is less than 3.00.
--    - Both conditions must be TRUE for a row to be included in the result.
-- 4. ORDER BY clause:
--    - Ensures the results are sorted chronologically by InvoiceDate from earliest to latest.

-- Example of results:
-- If the Invoice table contains the following data:
-- | InvoiceDate          | BillingAddress  | BillingCity | Total |
-- |----------------------|-----------------|-------------|-------|
-- | 2010-05-22 10:00:00 | 123 Main St     | New York    | 2.50  |
-- | 2010-05-23 14:00:00 | 456 Elm St      | Boston      | 2.99  |
-- | 2010-05-24 09:30:00 | 789 Oak St      | Chicago     | 3.50  |

-- After applying WHERE DATE(InvoiceDate) > "2010-05-22" AND Total < 3.00 and ORDER BY InvoiceDate:
-- | InvoiceDate          | BillingAddress  | BillingCity | Total |
-- |----------------------|-----------------|-------------|-------|
-- | 2010-05-23 14:00:00 | 456 Elm St      | Boston      | 2.99  |

-- Purpose:
-- This query is useful for identifying invoices issued after a specific date and with totals below a defined threshold, which can help:
-- - Track smaller transactions after a specific date.
-- - Perform targeted analysis on low-value sales within a certain period.
-- - Generate reports for auditing purposes.

-- Notes:
-- - The DATE() function ensures that only the date portion of InvoiceDate is considered for comparison, ignoring the time component.
-- - The AND operator combines multiple conditions. Both must be TRUE for a row to be included in the result.
-- - The ORDER BY clause organizes the results by invoice date for easier chronological analysis.

-- Alternative Queries:
-- - To include invoices from "2010-05-22" onward (inclusive), use `>=` instead of `>`.
--   WHERE DATE(InvoiceDate) >= "2010-05-22"
-- - To analyze totals in a specific range, combine conditions with BETWEEN:
--   WHERE Total BETWEEN 1.00 AND 3.00
