/*
Task: Retrieve and display invoice details for a specific date.
Result:
- A list of invoices where the invoice date matches "2010-05-22 00:00:00."
- The results are sorted by the invoice date in ascending order (default).

Purpose:
To generate a report of invoices issued on a specific date for tracking or analysis.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves invoice details for a specific invoice date and sorts the results by invoice date.
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
    InvoiceDate = "2010-05-22 00:00:00"  -- Filters results to include only invoices with the exact date and time "2010-05-22 00:00:00."
ORDER BY 
    InvoiceDate;              -- Sorts the results by InvoiceDate in ascending order.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves four columns from the Invoice table:
--      a) InvoiceDate: The date and time the invoice was issued.
--      b) BillingAddress: The customer's billing address.
--      c) BillingCity: The customer's billing city.
--      d) Total: The total amount of the invoice.
-- 2. FROM clause:
--    - Specifies the Invoice table as the source of the data.
-- 3. WHERE clause:
--    - Filters the data to include only rows where the InvoiceDate is exactly "2010-05-22 00:00:00."
--    - This is an exact match, so the query will return only invoices issued at this precise date and time.
-- 4. ORDER BY clause:
--    - Sorts the filtered results by the InvoiceDate in ascending order (earliest to latest).
--    - Since all results match a single date and time, the ORDER BY clause ensures chronological ordering if there are multiple records.

-- Example of results:
-- If the Invoice table contains the following data:
-- | InvoiceDate          | BillingAddress  | BillingCity | Total |
-- |----------------------|-----------------|-------------|-------|
-- | 2010-05-22 00:00:00 | 123 Main St     | New York    | 150.00|
-- | 2010-05-22 00:00:00 | 456 Elm St      | Boston      | 200.00|
-- | 2010-05-23 00:00:00 | 789 Oak St      | Chicago     | 175.00|

-- After applying WHERE InvoiceDate = "2010-05-22 00:00:00" and ORDER BY InvoiceDate:
-- | InvoiceDate          | BillingAddress  | BillingCity | Total |
-- |----------------------|-----------------|-------------|-------|
-- | 2010-05-22 00:00:00 | 123 Main St     | New York    | 150.00|
-- | 2010-05-22 00:00:00 | 456 Elm St      | Boston      | 200.00|

-- Purpose:
-- This query is used to generate a detailed report of invoices issued on a specific date, which is useful for:
-- - Daily sales tracking.
-- - Auditing transactions for a specific time period.
-- - Monitoring business activity on particular dates.

-- Notes:
-- - The date and time must match exactly. If the time portion differs, the record will not be included in the result.
-- - If you want to filter for all invoices issued on a specific day regardless of the time, use the `DATE()` function in the WHERE clause. For example:
--   WHERE DATE(InvoiceDate) = "2010-05-22"
-- - The ORDER BY clause ensures results are displayed in chronological order, but since all records match the same date and time in this case, it may not impact the final result.

-- Alternative Queries:
-- - To find invoices for a range of dates, use the `BETWEEN` operator:
--   WHERE InvoiceDate BETWEEN "2010-05-22 00:00:00" AND "2010-05-22 23:59:59".
