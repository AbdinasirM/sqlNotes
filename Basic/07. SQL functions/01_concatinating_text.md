/*
Topic: Creating a Mailing List of US Customers

Purpose:
- This query generates a mailing list for customers located in the United States (USA).
- The mailing list combines customer details, including their full name and address, into a single concatenated string.

Key Features:
1. **Concatenation**: Combines multiple fields (e.g., FirstName, LastName, Address) into a single field called "Mailing Address."
2. **Filtering**: Includes only customers whose `Country` field is "USA."
3. **Result**: Produces a user-friendly mailing address for each US-based customer.

Definition:
- **Concatenation**: Linking multiple strings or fields together in a single series.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query generates a concatenated mailing address for US-based customers.
*/

-- The SELECT statement retrieves specific columns and combines them into a mailing address:
SELECT 
    FirstName,                                         -- Retrieves the customer's first name.
    LastName,                                          -- Retrieves the customer's last name.
    Address,                                           -- Retrieves the customer's street address.
    -- Concatenates the first name, last name, and address with city, state, and postal code into a single field.
    FirstName || ' ' || LastName || ' ' || Address || ', ' || City || ', ' || State || ', ' || PostalCode AS "Mailing Address"
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
--    - Uses the concatenation operator (`||`) to combine these fields into a single field called "Mailing Address."
--    - The resulting "Mailing Address" field includes:
--      - FirstName, LastName, and Address, followed by:
--      - City, State, and PostalCode, all separated by commas and spaces for readability.
--    - Example of the concatenation logic:
--      FirstName || ' ' || LastName || ' ' || Address || ', ' || City || ', ' || State || ', ' || PostalCode
--      Result: "John Doe 123 Main St, New York, NY, 10001"
-- 2. FROM clause:
--    - Specifies the Customer table as the source of the data.
-- 3. WHERE clause:
--    - Filters the results to include only rows where the `Country` field equals "USA."
-- 4. Result:
--    - Produces a mailing list with a concatenated "Mailing Address" for all US-based customers.

-- Example of Table Structure:

-- Customer Table:
-- | CustomerId | FirstName | LastName | Address       | City       | State | PostalCode | Country |
-- |------------|-----------|----------|---------------|------------|-------|------------|---------|
-- | 1          | John      | Doe      | 123 Main St   | New York   | NY    | 10001      | USA     |
-- | 2          | Jane      | Smith    | 456 Oak St    | Los Angeles| CA    | 90001      | USA     |
-- | 3          | Mike      | Brown    | 789 Pine Ave  | Chicago    | IL    | 60601      | USA     |

-- After applying the query:
-- | FirstName | LastName | Address       | Mailing Address                              |
-- |-----------|----------|---------------|---------------------------------------------|
-- | John      | Doe      | 123 Main St   | John Doe 123 Main St, New York, NY, 10001   |
-- | Jane      | Smith    | 456 Oak St    | Jane Smith 456 Oak St, Los Angeles, CA, 90001|
-- | Mike      | Brown    | 789 Pine Ave  | Mike Brown 789 Pine Ave, Chicago, IL, 60601 |

-- Explanation of Results:
-- - Each row contains the customer's full name, address, and a single concatenated "Mailing Address" field.

-- Purpose:
-- This query is useful for:
-- - Generating mailing lists for marketing or communication purposes.
-- - Exporting data in a format suitable for labels or correspondence.
-- - Filtering data for specific regions or countries (e.g., USA in this case).

-- Notes:
-- - Ensure that the concatenation operator (`||`) is supported by the SQL implementation. For example:
--   - In MySQL, use `CONCAT()` instead of `||`.
--     Example: CONCAT(FirstName, ' ', LastName, ' ', Address, ', ', City, ', ', State, ', ', PostalCode).
-- - If handling NULL values, use `COALESCE()` to avoid incomplete results.

-- Alternative Queries:
-- - To include customers from other countries, adjust the WHERE clause:
--   WHERE Country IN ('USA', 'Canada', 'UK');
-- - To count the number of US-based customers:
--   SELECT COUNT(*) AS USCustomerCount FROM Customer WHERE Country = 'USA';
-- - To group mailing addresses by state for batch processing:
--   SELECT State, COUNT(*) AS CustomerCount FROM Customer WHERE Country = 'USA' GROUP BY State;
