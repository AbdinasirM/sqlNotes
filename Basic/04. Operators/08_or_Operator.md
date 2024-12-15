/*
Task: Retrieve and display invoice details for cities that start with the letter "P" or "D."
Result:
- A list of invoices where the BillingCity begins with "P" or "D."
- The results are sorted by the InvoiceDate in ascending order.

Purpose:
To generate a report of invoices filtered by city names starting with specific letters, organized by invoice date.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves invoice details for cities starting with "P" or "D" and sorts them by the invoice date.
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
    BillingCity LIKE "P%"     -- Filters results for cities starting with the letter "P."
    OR BillingCity LIKE "D%"  -- Adds a second condition to include cities starting with the letter "D."
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
--    - Uses the LIKE operator to filter rows where BillingCity matches specific patterns:
--      a) `LIKE "P%"`: Matches cities where the name starts with the letter "P."
--      b) `LIKE "D%"`: Matches cities where the name starts with the letter "D."
--      c) The OR operator ensures that either of these conditions being true will include the row in the result.
-- 4. ORDER BY clause:
--    - Ensures the results are sorted chronologically by InvoiceDate from earliest to latest.

-- Example of results:
-- If the Invoice table contains the following data:
-- | InvoiceDate          | BillingAddress  | BillingCity | Total |
-- |----------------------|-----------------|-------------|-------|
-- | 2024-12-10 00:00:00 | 123 Main St     | Paris       | 150.00|
-- | 2024-12-11 00:00:00 | 456 Elm St      | Dallas      | 200.00|
-- | 2024-12-12 00:00:00 | 789 Oak St      | Chicago     | 175.00|
-- | 2024-12-13 00:00:00 | 321 Maple St    | Denver      | 300.00|

-- After applying WHERE BillingCity LIKE "P%" OR BillingCity LIKE "D%" and ORDER BY InvoiceDate:
-- | InvoiceDate          | BillingAddress  | BillingCity | Total |
-- |----------------------|-----------------|-------------|-------|
-- | 2024-12-10 00:00:00 | 123 Main St     | Paris       | 150.00|
-- | 2024-12-11 00:00:00 | 456 Elm St      | Dallas      | 200.00|
-- | 2024-12-13 00:00:00 | 321 Maple St    | Denver      | 300.00|

-- Purpose:
-- This query provides a targeted report of invoices for customers in cities starting with "P" or "D." 
-- It is useful for generating city-specific reports or regional analysis.

-- Notes:
-- - The LIKE operator is case-insensitive in most SQL implementations. "Paris" and "paris" would both match "P%."
-- - The `%` wildcard matches zero or more characters following the specified pattern.
-- - The OR operator ensures that rows matching either pattern ("P%" or "D%") are included.
-- - The ORDER BY clause organizes the results for easier chronological analysis.

-- Alternative Queries:
-- - To target cities starting with "P," "D," or other letters, add additional conditions:
--   WHERE BillingCity LIKE "P%" OR BillingCity LIKE "D%" OR BillingCity LIKE "S%"
-- - To combine this query with other filters, such as a date range or total amount:
--   WHERE (BillingCity LIKE "P%" OR BillingCity LIKE "D%") AND Total > 100.00
