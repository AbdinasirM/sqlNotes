/*
Topic: Grouping Data by Multiple Fields

Purpose:
- This query calculates the average invoice totals grouped by both `BillingCountry` and `BillingCity`.
- It demonstrates how to group data by multiple columns using the `GROUP BY` clause.

Key Features:
1. **Grouping by Multiple Fields**:
   - The `GROUP BY` clause groups rows first by `BillingCountry` and then by `BillingCity`.
   - This creates unique groups for each combination of country and city.
2. **Calculating Aggregates**:
   - Uses the `AVG` function to calculate the average invoice total for each group.
3. **Formatting Results**:
   - Applies the `ROUND` function to format the average values to two decimal places.
4. **Sorting**:
   - Orders the results alphabetically by `BillingCity`.

Definitions:
- **GROUP BY with Multiple Fields**: Groups rows by combinations of values in two or more columns, producing a separate result for each unique combination.
- **Aggregate Functions**: Functions like AVG, SUM, and COUNT that operate on grouped data and return a single result per group.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query calculates the average invoice totals grouped by both country and city, ordered by city name.
*/

-- The SELECT statement calculates average invoice totals for groups defined by country and city:
SELECT
    BillingCountry AS "Country",         -- Retrieves the billing country and renames the column to "Country."
    BillingCity AS "City",               -- Retrieves the billing city and renames the column to "City."
    ROUND(AVG(total), 2) AS "Avg Total" -- Calculates the average total for each country-city group and rounds to 2 decimal places.
FROM 
    Invoice                              -- Specifies the Invoice table as the source of the data.
GROUP BY
    BillingCountry,                      -- Groups rows first by billing country.
    BillingCity                          -- Then groups rows by billing city within each country.
ORDER BY
    BillingCity;                         -- Sorts the results alphabetically by city name.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves `BillingCountry` and `BillingCity` columns to define the grouping fields.
--    - Applies the `AVG` function to the `total` column to calculate the average invoice total for each country-city group.
--    - Uses the `ROUND` function to format the average values to two decimal places.
-- 2. FROM clause:
--    - Specifies the Invoice table as the source of the data.
-- 3. GROUP BY clause:
--    - Groups rows first by `BillingCountry` and then by `BillingCity`.
--    - Each unique combination of country and city forms a group, and aggregate functions are applied to each group independently.
-- 4. ORDER BY clause:
--    - Sorts the results alphabetically by `BillingCity`.

-- Example of Table Structure:

-- Invoice Table:
-- | InvoiceId | BillingCountry | BillingCity | Total  |
-- |-----------|----------------|-------------|--------|
-- | 1         | USA            | New York    | 150.00 |
-- | 2         | USA            | Los Angeles | 200.00 |
-- | 3         | USA            | New York    | 250.00 |
-- | 4         | Canada         | Toronto     | 100.00 |

-- After applying the query:
-- | Country     | City         | Avg Total |
-- |-------------|--------------|-----------|
-- | USA         | Los Angeles  | 200.00    |
-- | Canada      | Toronto      | 100.00    |
-- | USA         | New York     | 200.00    |

-- Explanation of Results:
-- - The `GROUP BY` clause creates groups for each unique combination of country and city.
-- - The `AVG(total)` function calculates the average invoice total for each group:
--   - Los Angeles (USA): 200.00
--   - Toronto (Canada): 100.00
--   - New York (USA): (150.00 + 250.00) / 2 = 200.00
-- - The `ORDER BY` clause sorts the results alphabetically by city name.

-- Purpose:
-- This query is useful for:
-- - Generating detailed reports of financial data grouped by multiple geographic fields (e.g., country and city).
-- - Analyzing average invoice totals across regions.
-- - Producing summaries for business decisions or marketing campaigns.

-- Notes:
-- - Grouping by multiple fields ensures that each unique combination of country and city is treated as a separate group.
-- - The `ROUND` function ensures consistent formatting for numeric results.

-- Alternative Queries:
-- - To calculate the total invoice amounts instead of averages:
--   SELECT BillingCountry, BillingCity, SUM(total) AS "Total Sales"
--   FROM Invoice
--   GROUP BY BillingCountry, BillingCity
--   ORDER BY BillingCity;
-- - To sort by the highest average total instead of city name:
--   ORDER BY AVG(total) DESC;
-- - To filter for specific countries or cities:
--   WHERE BillingCountry = 'USA' AND BillingCity LIKE 'N%';
-- - To count the number of invoices per city and country:
--   SELECT BillingCountry, BillingCity, COUNT(*) AS "Invoice Count"
--   FROM Invoice
--   GROUP BY BillingCountry, BillingCity;
