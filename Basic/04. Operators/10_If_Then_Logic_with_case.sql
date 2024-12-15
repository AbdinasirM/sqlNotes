/*
Task: Classify invoices into categories based on their total amount and retrieve details of invoices 
classified as "Top Performer."
Result:
- A list of invoices where the `PurchaseType` is classified as "Top Performer."
- Includes the invoice date, billing address, billing city, total amount, and the calculated purchase type.
- Results are sorted by the InvoiceDate in ascending order.

Purpose:
To demonstrate the use of the `CASE` statement for categorizing data and the PEMDAS rule for handling logical precedence.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query categorizes invoices based on their total amount into different purchase types
and filters for invoices classified as "Top Performer."
*/

-- The SELECT statement retrieves the specified columns from the Invoice table:
SELECT
    InvoiceDate,              -- The date and time the invoice was generated.
    BillingAddress,           -- The customer's billing address.
    BillingCity,              -- The city associated with the billing address.
    Total,                    -- The total amount of the invoice.
    CASE
        WHEN Total < 2.00 THEN "Baseline Purchase"        -- Classifies totals below 2.00 as "Baseline Purchase."
        WHEN Total BETWEEN 2.00 AND 6.99 THEN "Low Purchase" -- Classifies totals between 2.00 and 6.99 as "Low Purchase."
        WHEN Total BETWEEN 7.00 AND 15.00 THEN "Target Purchase" -- Classifies totals between 7.00 and 15.00 as "Target Purchase."
        ELSE "Top Performer"                              -- Classifies totals greater than 15.00 as "Top Performer."
    END AS PurchaseType                                   -- Assigns the classification to a new column called PurchaseType.
FROM
    Invoice                                               -- Specifies the Invoice table as the data source.
WHERE
    PurchaseType = "Top Performer"                        -- Filters results for invoices classified as "Top Performer."
ORDER BY
    InvoiceDate;                                          -- Sorts the results by InvoiceDate in ascending order.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves five columns:
--      a) InvoiceDate: The date and time the invoice was issued.
--      b) BillingAddress: The customer's billing address.
--      c) BillingCity: The customer's billing city.
--      d) Total: The total amount of the invoice.
--      e) PurchaseType: A new column created using the `CASE` statement that categorizes invoices based on Total.
-- 2. CASE statement:
--    - Evaluates the `Total` column and assigns a category to each row:
--      a) "Baseline Purchase" for totals below 2.00.
--      b) "Low Purchase" for totals between 2.00 and 6.99.
--      c) "Target Purchase" for totals between 7.00 and 15.00.
--      d) "Top Performer" for totals greater than 15.00 (default case using `ELSE`).
-- 3. FROM clause:
--    - Specifies the Invoice table as the source of data.
-- 4. WHERE clause:
--    - Filters the results to include only rows where the PurchaseType is "Top Performer."
--    - Logical precedence ensures that the `CASE` statement is evaluated first to calculate `PurchaseType`, which is then used in filtering.
-- 5. ORDER BY clause:
--    - Sorts the filtered results chronologically by InvoiceDate from earliest to latest.

-- Example of results:
-- If the Invoice table contains the following data:
-- | InvoiceDate          | BillingAddress  | BillingCity | Total |
-- |----------------------|-----------------|-------------|-------|
-- | 2024-12-10 00:00:00 | 123 Main St     | Paris       | 16.00 |
-- | 2024-12-11 00:00:00 | 456 Elm St      | Dallas      | 20.00 |
-- | 2024-12-12 00:00:00 | 789 Oak St      | Chicago     | 5.00  |

-- After applying the CASE statement and WHERE PurchaseType = "Top Performer":
-- | InvoiceDate          | BillingAddress  | BillingCity | Total | PurchaseType   |
-- |----------------------|-----------------|-------------|-------|----------------|
-- | 2024-12-10 00:00:00 | 123 Main St     | Paris       | 16.00 | Top Performer  |
-- | 2024-12-11 00:00:00 | 456 Elm St      | Dallas      | 20.00 | Top Performer  |

-- Purpose:
-- This query is used to analyze invoices categorized as "Top Performer" based on the total amount, which helps in:
-- - Identifying high-value transactions.
-- - Segmenting invoices for targeted reporting or marketing.

-- Notes:
-- - The `CASE` statement is evaluated for each row before the WHERE clause is applied.
-- - Ensure the PurchaseType field is correctly referenced in the WHERE clause. Some SQL implementations may require wrapping the `CASE` logic in a subquery or CTE (Common Table Expression) for filtering.
-- - The ORDER BY clause organizes the filtered results for chronological analysis.

-- Alternative Queries:
-- - To include additional categories in the results, remove the WHERE clause and sort by `PurchaseType`:
--   ORDER BY PurchaseType, InvoiceDate
-- - To filter by multiple categories, use:
--   WHERE PurchaseType IN ("Top Performer", "Target Purchase")
