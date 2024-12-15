/*
Task: Retrieve and display invoice details for customers located in specific cities.
Result:
- A list of invoices that match the specified billing cities: "Brussels," "Orlando," or "Paris."
- The results are sorted by invoice date in ascending order (default).

Purpose of the Query:
To generate a filtered report of invoices for customers in specific cities, organized by invoice date.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves invoice details for customers located in Brussels, Orlando, or Paris
and sorts the results by invoice date.
*/

-- The SELECT statement retrieves the specified columns from the Invoice table:
SELECT
    InvoiceDate,              -- The date the invoice was generated.
    BillingAddress,           -- The customer's billing address.
    BillingCity,              -- The city associated with the billing address.
    Total                     -- The total amount of the invoice.
FROM 
    Invoice                   -- Specifies the Invoice table as the data source.
WHERE  
    BillingCity IN ("Brussels", "Orlando", "Paris")  -- Filters results to include only invoices where the BillingCity is either "Brussels," "Orlando," or "Paris."
ORDER BY 
    InvoiceDate;              -- Sorts the filtered results by InvoiceDate in ascending order.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves four columns from the Invoice table:
--      a) InvoiceDate: The date the invoice was issued.
--      b) BillingAddress: The customer's billing address.
--      c) BillingCity: The city associated with the billing address.
--      d) Total: The total amount of the invoice.
-- 2. FROM clause:
--    - Specifies the Invoice table as the source of data.
-- 3. WHERE clause:
--    - Uses the IN operator to filter results for specific cities: "Brussels," "Orlando," or "Paris."
--    - This is equivalent to writing `BillingCity = 'Brussels' OR BillingCity = 'Orlando' OR BillingCity = 'Paris'.`
--    - Only invoices with these billing cities will appear in the results.
-- 4. ORDER BY clause:
--    - Ensures the results are sorted by the InvoiceDate column in ascending order (earliest to latest).

-- Example of results:
-- If the Invoice table contains the following data:
-- | InvoiceDate | BillingAddress  | BillingCity | Total |
-- |-------------|-----------------|-------------|-------|
-- | 2024-12-10  | 123 Main St     | Brussels    | 150.00|
-- | 2024-12-11  | 456 Elm St      | Orlando     | 200.00|
-- | 2024-12-12  | 789 Oak St      | Paris       | 175.00|
-- | 2024-12-13  | 321 Maple St    | Berlin      | 300.00|

-- After applying WHERE BillingCity IN ("Brussels", "Orlando", "Paris") and ORDER BY InvoiceDate:
-- | InvoiceDate | BillingAddress  | BillingCity | Total |
-- |-------------|-----------------|-------------|-------|
-- | 2024-12-10  | 123 Main St     | Brussels    | 150.00|
-- | 2024-12-11  | 456 Elm St      | Orlando     | 200.00|
-- | 2024-12-12  | 789 Oak St      | Paris       | 175.00|

-- Purpose:
-- This query helps generate a targeted report of invoices for specific cities, which can be used for regional sales analysis or customer segmentation.

-- Notes:
-- - The IN operator simplifies filtering for multiple values and is more readable than using multiple OR conditions.
-- - If additional cities need to be included in the future, they can be easily added to the IN list.
-- - ORDER BY ensures that the results are presented in chronological order for easy analysis.
-- - This query can be extended with additional filtering conditions (e.g., date range or minimum total amount).
