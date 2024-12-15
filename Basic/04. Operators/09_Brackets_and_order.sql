/*
Task: Retrieve and display invoice details where the total amount is greater than 1.98, 
and the billing city starts with either "P" or "D."
Result:
- A list of invoices meeting the specified criteria, sorted by the invoice date in ascending order.

Purpose:
To demonstrate the use of the PEMDAS rule (Parentheses, Exponents, Multiplication/Division, Addition/Subtraction) 
in SQL queries for controlling logical operations.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves invoices with totals greater than 1.98, where the billing city starts with "P" or "D."
It uses parentheses to group conditions and enforce logical precedence.
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
    Total > 1.98              -- Filters results for invoices with a total amount greater than 1.98.
    AND (BillingCity LIKE "P%" OR BillingCity LIKE "D%")  -- Further filters results for cities starting with "P" or "D."
ORDER BY
    InvoiceDate;              -- Sorts the results by InvoiceDate in ascending order.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves the following columns: InvoiceDate, BillingAddress, BillingCity, and Total.
-- 2. FROM clause:
--    - Specifies the Invoice table as the source of the data.
-- 3. WHERE clause:
--    - Combines multiple conditions with logical operators (`AND` and `OR`) using parentheses to control precedence:
--      a) `Total > 1.98`: Filters invoices where the total amount exceeds 1.98.
--      b) `(BillingCity LIKE "P%" OR BillingCity LIKE "D%")`: Groups conditions to match cities starting with "P" or "D."
--      c) The parentheses ensure that the OR condition is evaluated before the AND condition (PEMDAS rule).
--    - The query includes a row only if both conditions are TRUE:
--      i) The total is greater than 1.98.
--      ii) The city name starts with "P" or "D."
-- 4. ORDER BY clause:
--    - Sorts the filtered results chronologically by InvoiceDate from earliest to latest.

-- Example of results:
-- If the Invoice table contains the following data:
-- | InvoiceDate          | BillingAddress  | BillingCity | Total |
-- |----------------------|-----------------|-------------|-------|
-- | 2024-12-10 00:00:00 | 123 Main St     | Paris       | 2.50  |
-- | 2024-12-11 00:00:00 | 456 Elm St      | Dallas      | 3.00  |
-- | 2024-12-12 00:00:00 | 789 Oak St      | Chicago     | 1.50  |
-- | 2024-12-13 00:00:00 | 321 Maple St    | Denver      | 2.75  |

-- After applying WHERE Total > 1.98 AND (BillingCity LIKE "P%" OR BillingCity LIKE "D%") and ORDER BY InvoiceDate:
-- | InvoiceDate          | BillingAddress  | BillingCity | Total |
-- |----------------------|-----------------|-------------|-------|
-- | 2024-12-10 00:00:00 | 123 Main St     | Paris       | 2.50  |
-- | 2024-12-11 00:00:00 | 456 Elm St      | Dallas      | 3.00  |
-- | 2024-12-13 00:00:00 | 321 Maple St    | Denver      | 2.75  |

-- Purpose:
-- This query generates a filtered list of invoices based on multiple conditions, demonstrating the use of parentheses to control logical precedence.

-- Notes:
-- - **PEMDAS Rule in SQL Logical Operators:**
--   1. Parentheses have the highest precedence, allowing grouped conditions to be evaluated first.
--   2. The `AND` operator is evaluated before the `OR` operator.
--   3. Without parentheses, the query might behave differently. For example:
--      `Total > 1.98 AND BillingCity LIKE "P%" OR BillingCity LIKE "D%"` would include rows where:
--      - Total > 1.98 AND City starts with "P," OR
--      - City starts with "D," regardless of Total.
-- - Always use parentheses when combining `AND` and `OR` to ensure clarity and correctness.

-- Alternative Queries:
-- - To include totals equal to 1.98, modify the condition:
--   WHERE Total >= 1.98 AND (BillingCity LIKE "P%" OR BillingCity LIKE "D%")
-- - To include cities starting with additional letters, extend the OR condition:
--   WHERE Total > 1.98 AND (BillingCity LIKE "P%" OR BillingCity LIKE "D%" OR BillingCity LIKE "S%")
