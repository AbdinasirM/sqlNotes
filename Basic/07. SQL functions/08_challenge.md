/*
SQL Challenge: Customer Postal Code Transformation at Red30 Tech

Purpose:
- This query standardizes the postal codes of US-based customers for a marketing campaign.
- It creates a report with the full name of each customer and their postal code in a uniform five-digit format.

Key Features:
1. **Concatenation**:
   - Combines the first and last names of customers into a single "CustomerFullName" field.
2. **String Truncation**:
   - Uses the `SUBSTR` function to extract the first five digits of the postal code.
3. **Filtering**:
   - Includes only customers whose `Country` field is "USA."
4. **Sorting**:
   - Orders the results alphabetically by the "CustomerFullName" field for easier readability.

Definitions:
- **Concatenation**: Combining multiple strings or fields into a single string.
- **SUBSTR**: A function that extracts a portion of a string based on the starting position and length.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query standardizes postal codes to a five-digit format for US-based customers and lists their full names.
*/

-- The SELECT statement retrieves and processes customer data:
SELECT
    -- Combines the customer's first and last names into a single field called "CustomerFullName."
    FirstName || ' ' || LastName AS CustomerFullName,
    -- Extracts the first five digits of the PostalCode using the SUBSTR function.
    SUBSTR(PostalCode, 1, 5) AS StandardizedPostalCode
FROM 
    Customer AS c                            -- Assigns the alias `c` to the Customer table.
WHERE
    Country = 'USA'                          -- Filters the results to include only customers located in the USA.
ORDER BY 
    CustomerFullName;                        -- Sorts the results alphabetically by the "CustomerFullName" field.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Combines customer names and standardizes postal codes:
--      a) `FirstName || ' ' || LastName`: Concatenates the first and last names of the customer with a space in between.
--         - Example:
--           FirstName = "John", LastName = "Doe" => "John Doe"
--      b) `SUBSTR(PostalCode, 1, 5)`: Extracts the first five digits of the PostalCode.
--         - Example:
--           PostalCode = "12345-6789" => "12345"
-- 2. FROM clause:
--    - Specifies the Customer table as the source of the data.
-- 3. WHERE clause:
--    - Filters the data to include only rows where the `Country` field equals "USA."
-- 4. ORDER BY clause:
--    - Ensures the results are sorted alphabetically by the "CustomerFullName" field.

-- Example of Table Structure:

-- Customer Table:
-- | CustomerId | FirstName | LastName | PostalCode  | Country |
-- |------------|-----------|----------|-------------|---------|
-- | 1          | John      | Doe      | 12345-6789  | USA     |
-- | 2          | Jane      | Smith    | 90001-5678  | USA     |
-- | 3          | Mike      | Brown    | 60601       | USA     |

-- After applying the query:
-- | CustomerFullName | StandardizedPostalCode |
-- |------------------|-------------------------|
-- | John Doe         | 12345                  |
-- | Jane Smith       | 90001                  |
-- | Mike Brown       | 60601                  |

-- Explanation of Results:
-- - The "CustomerFullName" column combines the first and last names of each customer.
-- - The "StandardizedPostalCode" column displays only the first five digits of the postal code.
-- - Results are filtered to include only customers located in the USA and sorted alphabetically by "CustomerFullName."

-- Purpose:
-- This query is useful for:
-- - Standardizing postal codes to a uniform format for successful delivery in marketing campaigns.
-- - Generating mailing lists with customer names and standardized postal codes.
-- - Filtering and organizing data specifically for US-based customers.

-- Notes:
-- - Ensure that the `SUBSTR` function is supported by your SQL implementation. In MySQL, the equivalent function is `SUBSTRING`:
--   - Example: SUBSTRING(PostalCode, 1, 5).
-- - For NULL or invalid postal codes, consider handling exceptions with `COALESCE`:
--   - Example: COALESCE(SUBSTR(PostalCode, 1, 5), '00000').

-- Alternative Queries:
-- - To include additional countries, adjust the WHERE clause:
--   WHERE Country IN ('USA', 'Canada');
-- - To filter out customers with incomplete or NULL postal codes:
--   WHERE Country = 'USA' AND LENGTH(PostalCode) >= 5;
-- - To count the number of US-based customers:
--   SELECT COUNT(*) AS USCustomerCount FROM Customer WHERE Country = 'USA';
