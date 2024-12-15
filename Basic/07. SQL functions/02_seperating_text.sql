/*
Topic: Creating a Mailing List of US Customers with Truncated Postal Codes

Purpose:
- This query generates a mailing list for US-based customers.
- It concatenates customer details (name and address) into a single "Mailing Address" field.
- It truncates the PostalCode field to the first 5 digits using the `SUBSTR` function.

Key Features:
1. **Concatenation**: Combines multiple fields (e.g., FirstName, LastName, Address) into a single "Mailing Address" field.
2. **String Truncation**: Uses the `SUBSTR` function to extract only the first 5 characters of the PostalCode field.
3. **Filtering**: Includes only customers whose `Country` field is "USA."
4. **Result**: Produces a mailing address and truncated postal code for each US-based customer.

Definitions:
- **Truncate**: To shorten or reduce the length of a string or text.
- **SUBSTR**: A function used to extract a portion of a string based on position and length.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query generates a mailing list for US-based customers and truncates postal codes to 5 digits.
*/

-- The SELECT statement retrieves specific columns and formats them:
SELECT 
    FirstName,                                         -- Retrieves the customer's first name.
    LastName,                                          -- Retrieves the customer's last name.
    Address,                                           -- Retrieves the customer's street address.
    -- Concatenates the first name, last name, and address with city, state, and postal code into a single field.
    FirstName || ' ' || LastName || ' ' || Address || ', ' || City || ', ' || State || ', ' || PostalCode AS "Mailing Address",
    -- Extracts the first 5 characters of the PostalCode field using the SUBSTR function.
    SUBSTR(PostalCode, 1, 5) AS "5 Digit Postal Code"
FROM 
    Customer                                           -- Specifies the Customer table as the data source.
WHERE 
    Country = 'USA';                                   -- Filters the results to include only customers located in the USA.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves specific fields from the Customer table:
--      a) FirstName: The customer's first name.
--      b) LastName: The customer's last name.
--      c) Address: The street address of the customer.
--    - Concatenates these fields into a single "Mailing Address" field:
--      - Combines FirstName, LastName, Address, City, State, and PostalCode into a readable mailing format.
--      - Example:
--        FirstName || ' ' || LastName || ' ' || Address || ', ' || City || ', ' || State || ', ' || PostalCode
--        Result: "John Doe 123 Main St, New York, NY, 10001"
--    - Uses the `SUBSTR` function to truncate the PostalCode field to its first 5 digits.
--      - Syntax: `SUBSTR(column_name, start_position, length)`
--      - Example: SUBSTR(PostalCode, 1, 5)
--        PostalCode = "12345-6789" => Result = "12345"
-- 2. FROM clause:
--    - Specifies the Customer table as the source of the data.
-- 3. WHERE clause:
--    - Filters the results to include only rows where the `Country` field equals "USA."
-- 4. Result:
--    - Produces a mailing list with a formatted "Mailing Address" and a 5-digit truncated postal code.

-- Example of Table Structure:

-- Customer Table:
-- | CustomerId | FirstName | LastName | Address       | City       | State | PostalCode  | Country |
-- |------------|-----------|----------|---------------|------------|-------|-------------|---------|
-- | 1          | John      | Doe      | 123 Main St   | New York   | NY    | 10001-1234  | USA     |
-- | 2          | Jane      | Smith    | 456 Oak St    | Los Angeles| CA    | 90001-5678  | USA     |
-- | 3          | Mike      | Brown    | 789 Pine Ave  | Chicago    | IL    | 60601-4321  | USA     |

-- After applying the query:
-- | FirstName | LastName | Address       | Mailing Address                              | 5 Digit Postal Code |
-- |-----------|----------|---------------|---------------------------------------------|----------------------|
-- | John      | Doe      | 123 Main St   | John Doe 123 Main St, New York, NY, 10001   | 10001               |
-- | Jane      | Smith    | 456 Oak St    | Jane Smith 456 Oak St, Los Angeles, CA, 90001| 90001               |
-- | Mike      | Brown    | 789 Pine Ave  | Mike Brown 789 Pine Ave, Chicago, IL, 60601 | 60601               |

-- Explanation of Results:
-- - Each row includes the customer's full name, address, a formatted "Mailing Address," and the first 5 digits of their postal code.

-- Purpose:
-- This query is useful for:
-- - Generating mailing lists for marketing campaigns or correspondence.
-- - Standardizing postal codes to 5 digits for compatibility with mailing systems.
-- - Filtering and formatting data for US-based customers.

-- Notes:
-- - Ensure that the `SUBSTR` function is supported by the SQL implementation. For example:
--   - In MySQL, use `SUBSTRING()` instead of `SUBSTR`.
--     Example: SUBSTRING(PostalCode, 1, 5)
-- - If handling NULL values in PostalCode, use `COALESCE()` to provide a default value:
--   Example: COALESCE(SUBSTR(PostalCode, 1, 5), '00000') AS "5 Digit Postal Code".

-- Alternative Queries:
-- - To include customers from multiple countries:
--   WHERE Country IN ('USA', 'Canada');
-- - To group customers by state and count their mailing addresses:
--   SELECT State, COUNT(*) AS CustomerCount FROM Customer WHERE Country = 'USA' GROUP BY State;
-- - To exclude incomplete postal codes:
--   WHERE LENGTH(PostalCode) >= 5;
