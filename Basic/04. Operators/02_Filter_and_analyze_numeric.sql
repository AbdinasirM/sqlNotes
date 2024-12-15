/*
Task: Retrieve and display invoice details for all invoices where the total amount is exactly 1.98.
Result:
- A list of invoices including the invoice date, billing address, billing city, and total amount.
- The results are sorted by the invoice date in ascending order (default order).

Purpose of the Query:
To generate a report of invoices with a specific total amount (1.98) and organize them chronologically by the invoice date.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves invoices where the total amount is 1.98 and sorts them by the invoice date.
*/

-- The SELECT statement retrieves four specific columns from the Invoice table:
SELECT
    InvoiceDate,              -- The date when the invoice was generated.
    BillingAddress,           -- The billing address of the customer.
    BillingCity,              -- The city associated with the billing address.
    Total                     -- The total amount of the invoice.
FROM 
    Invoice                   -- Specifies the Invoice table as the data source.
WHERE  
    Total = 1.98              -- Filters the results to include only invoices with a total amount equal to 1.98.
ORDER BY 
    InvoiceDate;              -- Sorts the filtered results by the InvoiceDate column in ascending order.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves the following columns from the Invoice table:
--      a) InvoiceDate: The date the invoice was issued.
--      b) BillingAddress: The customer's billing address.
--      c) BillingCity: The customer's billing city.
--      d) Total: The total amount of the invoice.
-- 2. FROM clause:
--    - Indicates that the data is being retrieved from the Invoice table.
-- 3. WHERE clause:
--    - Filters the data to include only invoices where the Total amount is exactly 1.98.
--    - The '=' operator is used for equality comparison.
-- 4. ORDER BY clause:
--    - Ensures the results are sorted by InvoiceDate in ascending order (earliest to latest).
--    - This makes it easier to analyze the data in chronological order.

-- Example of Results:
-- If the Invoice table contains the following data:
-- | InvoiceDate | BillingAddress  | BillingCity | Total |
-- |-------------|-----------------|-------------|-------|
-- | 2024-12-10  | 123 Main St     | New York    | 1.98  |
-- | 2024-12-11  | 456 Elm St      | Boston      | 1.98  |
-- | 2024-12-12  | 789 Oak St      | Chicago     | 3.50  |
-- | 2024-12-13  | 321 Maple St    | Seattle     | 1.98  |

-- After applying WHERE Total = 1.98 and ORDER BY InvoiceDate:
-- | InvoiceDate | BillingAddress  | BillingCity | Total |
-- |-------------|-----------------|-------------|-------|
-- | 2024-12-10  | 123 Main St     | New York    | 1.98  |
-- | 2024-12-11  | 456 Elm St      | Boston      | 1.98  |
-- | 2024-12-13  | 321 Maple St    | Seattle     | 1.98  |

-- Purpose:
-- This query is useful for identifying invoices with a specific total value and presenting them in a time-ordered list.

-- Notes:
-- - If there are no invoices with a total of 1.98, the result set will be empty.
-- - To sort in descending order (latest to earliest), use `ORDER BY InvoiceDate DESC`.
-- - To filter for approximate values (e.g., totals close to 1.98), use `WHERE Total BETWEEN 1.90 AND 2.00`.
