/*
Task: Retrieve and display invoice details based on specific patterns in the city names using the LIKE operator.
Queries:
1. List invoices where the billing city starts with the letter 'B'.
2. List invoices where the billing city contains the letter 'B' anywhere in the name.
Result:
- A list of invoices filtered by the specified patterns, sorted by invoice date in ascending order.

Purpose:
To demonstrate how the `LIKE` operator can be used with the `%` wildcard to match patterns in string data.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: These queries retrieve invoice details based on pattern matching in the BillingCity field.
*/

-- Query 1: Retrieve invoices where the billing city starts with 'B':
SELECT
    InvoiceDate,              -- The date the invoice was generated.
    BillingAddress,           -- The customer's billing address.
    BillingCity,              -- The city associated with the billing address.
    Total                     -- The total amount of the invoice.
FROM 
    Invoice                   -- Specifies the Invoice table as the data source.
WHERE  
    BillingCity LIKE 'B%'     -- Filters cities that start with 'B'. The % matches any characters following 'B'.
ORDER BY 
    InvoiceDate;              -- Sorts the results by InvoiceDate in ascending order.

-- Explanation of Query 1:
-- 1. SELECT clause:
--    - Retrieves four columns: InvoiceDate, BillingAddress, BillingCity, and Total.
-- 2. FROM clause:
--    - Specifies the Invoice table as the data source.
-- 3. WHERE clause:
--    - The `LIKE` operator with 'B%' filters for cities that start with the letter 'B'.
--    - The `%` wildcard matches any sequence of characters following 'B'.
--    - Example matches: "Berlin," "Brussels," "Boston."
-- 4. ORDER BY clause:
--    - Ensures the results are sorted chronologically by InvoiceDate.

-- Example of results for Query 1:
-- If the Invoice table contains the following data:
-- | InvoiceDate | BillingAddress  | BillingCity | Total |
-- |-------------|-----------------|-------------|-------|
-- | 2024-12-10  | 123 Main St     | Berlin      | 150.00|
-- | 2024-12-11  | 456 Elm St      | Brussels    | 200.00|
-- | 2024-12-12  | 789 Oak St      | Paris       | 175.00|

-- After applying WHERE BillingCity LIKE 'B%' and ORDER BY InvoiceDate:
-- | InvoiceDate | BillingAddress  | BillingCity | Total |
-- |-------------|-----------------|-------------|-------|
-- | 2024-12-10  | 123 Main St     | Berlin      | 150.00|
-- | 2024-12-11  | 456 Elm St      | Brussels    | 200.00|

-- Query 2: Retrieve invoices where the billing city contains 'B' anywhere in the name:
SELECT
    InvoiceDate,              -- The date the invoice was generated.
    BillingAddress,           -- The customer's billing address.
    BillingCity,              -- The city associated with the billing address.
    Total                     -- The total amount of the invoice.
FROM 
    Invoice                   -- Specifies the Invoice table as the data source.
WHERE  
    BillingCity LIKE '%B%'    -- Filters cities that contain 'B' anywhere in the name. 
ORDER BY 
    InvoiceDate;              -- Sorts the results by InvoiceDate in ascending order.

-- Explanation of Query 2:
-- 1. SELECT clause:
--    - Retrieves four columns: InvoiceDate, BillingAddress, BillingCity, and Total.
-- 2. FROM clause:
--    - Specifies the Invoice table as the data source.
-- 3. WHERE clause:
--    - The `LIKE` operator with '%B%' filters for cities that contain the letter 'B' at any position.
--    - The `%` wildcard matches any sequence of characters before or after 'B'.
--    - Example matches: "Berlin," "Brussels," "Albany."
-- 4. ORDER BY clause:
--    - Ensures the results are sorted chronologically by InvoiceDate.

-- Example of results for Query 2:
-- If the Invoice table contains the following data:
-- | InvoiceDate | BillingAddress  | BillingCity | Total |
-- |-------------|-----------------|-------------|-------|
-- | 2024-12-10  | 123 Main St     | Berlin      | 150.00|
-- | 2024-12-11  | 456 Elm St      | Brussels    | 200.00|
-- | 2024-12-12  | 789 Oak St      | Albany      | 175.00|

-- After applying WHERE BillingCity LIKE '%B%' and ORDER BY InvoiceDate:
-- | InvoiceDate | BillingAddress  | BillingCity | Total |
-- |-------------|-----------------|-------------|-------|
-- | 2024-12-10  | 123 Main St     | Berlin      | 150.00|
-- | 2024-12-11  | 456 Elm St      | Brussels    | 200.00|
-- | 2024-12-12  | 789 Oak St      | Albany      | 175.00|

-- Purpose:
-- Query 1 targets cities starting with 'B,' while Query 2 targets cities containing 'B' anywhere.
-- These queries are useful for generating reports or performing targeted searches based on city name patterns.

-- Notes:
-- - The `%` wildcard is case-insensitive by default in most SQL implementations.
-- - `LIKE` is powerful for flexible text matching but may perform slower on large datasets without proper indexing.
-- - If exact matches are required, use the `=` operator instead of `LIKE`.
