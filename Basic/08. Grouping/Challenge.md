/*
SQL Challenge: Calculate Customer Average Spend per City at Red30 Tech

Purpose:
- This query calculates the average spending amount of customers in each city, helping Red30 Tech identify cities with the highest sales potential.
- By grouping data by city and calculating average customer spending, the report supports data-driven marketing budget allocation.

Key Features:
1. **Grouping by City**:
   - The `GROUP BY` clause organizes data into groups based on the `BillingCity` column, allowing aggregate functions to calculate metrics for each group.
2. **Calculating Average Spending**:
   - The `AVG` function calculates the average amount spent by customers in each city.
3. **Formatting Results**:
   - Uses the `ROUND` function to format the average spending amounts to two decimal places for clarity.
4. **Sorting**:
   - Orders the results alphabetically by city name in ascending order, as requested.

Definitions:
- **GROUP BY Clause**: Groups rows with the same value in a specified column, allowing aggregate functions like AVG to compute results for each group.
- **AVG Function**: Calculates the average value of a numeric column within each group.
- **ROUND Function**: Rounds numeric values to a specified number of decimal places for presentation.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query calculates the average spending amount by customers in each city and sorts the results by city name.
*/

-- The SELECT statement retrieves city names and calculates average spending:
SELECT
    i.BillingCity AS "City",            -- Retrieves the city name from the Invoice table and renames the column to "City."
    ROUND(AVG(i.Total), 2) AS "Average Spending"  -- Calculates the average spending for each city and rounds to two decimal places.
FROM
    Invoice AS i                        -- Specifies the Invoice table as the source of the data and aliases it as `i.`
GROUP BY
    i.BillingCity                       -- Groups rows by the `BillingCity` column, ensuring that averages are calculated per city.
ORDER BY 
    i.BillingCity ASC;                  -- Sorts the results alphabetically by city name in ascending order.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves the `BillingCity` column as "City."
--    - Applies the `AVG` function to the `Total` column to calculate the average spending for each city.
--    - Uses the `ROUND` function to format the average spending values to two decimal places.
-- 2. FROM clause:
--    - Specifies the `Invoice` table as the data source and aliases it as `i` for brevity.
-- 3. GROUP BY clause:
--    - Groups rows by `BillingCity` to calculate the average spending for each city independently.
-- 4. ORDER BY clause:
--    - Ensures the results are sorted alphabetically by city name in ascending order for better readability.

-- Example of Table Structure:

-- Invoice Table:
-- | InvoiceId | BillingCity  | Total  |
-- |-----------|--------------|--------|
-- | 1         | New York     | 150.00 |
-- | 2         | Los Angeles  | 200.00 |
-- | 3         | New York     | 250.00 |
-- | 4         | Chicago      | 100.00 |

-- After applying the query:
-- | City         | Average Spending |
-- |--------------|------------------|
-- | Chicago      | 100.00           |
-- | Los Angeles  | 200.00           |
-- | New York     | 200.00           |

-- Explanation of Results:
-- - The `GROUP BY` clause groups rows by city name.
-- - The `AVG(i.Total)` function calculates the average spending for each city:
--   - Chicago: 100.00
--   - Los Angeles: 200.00
--   - New York: (150.00 + 250.00) / 2 = 200.00
-- - The `ROUND` function formats the results to two decimal places.
-- - The `ORDER BY` clause sorts the results alphabetically by city name.

-- Purpose:
-- This query is useful for:
-- - Identifying cities with higher customer spending to optimize marketing strategies.
-- - Producing insights to guide the allocation of marketing budgets.
-- - Summarizing customer spending data for regional analysis.

-- Notes:
-- - The `ROUND` function ensures that the results are user-friendly and consistently formatted.
-- - This query is designed for a MySQL relational database management system but can be adapted for other SQL systems.

-- Alternative Queries:
-- - To calculate total spending instead of averages:
--   SELECT i.BillingCity, SUM(i.Total) AS "Total Spending"
--   FROM Invoice AS i
--   GROUP BY i.BillingCity
--   ORDER BY i.BillingCity ASC;
-- - To filter results for cities with average spending above a threshold:
--   HAVING AVG(i.Total) > 150;
-- - To include customer count per city:
--   SELECT i.BillingCity, ROUND(AVG(i.Total), 2) AS "Average Spending", COUNT(*) AS "Customer Count"
--   FROM Invoice AS i
--   GROUP BY i.BillingCity
--   ORDER BY i.BillingCity ASC;
