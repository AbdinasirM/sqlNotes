/*
Topic: Creating a Mailing List of US Customers with String Case Formatting and Postal Code Processing

Purpose:
- This query generates a mailing list for US-based customers with formatted names, addresses, and postal codes.
- It applies text transformations to customer names and truncates postal codes to their first 5 digits.
- It also calculates the length of the postal code for each customer.

Key Features:
1. **String Case Formatting**:
   - Converts first names to uppercase using the `UPPER` function.
   - Converts last names to lowercase using the `LOWER` function.
2. **Concatenation**:
   - Combines multiple fields (e.g., FirstName, LastName, Address) into a single "Mailing Address" field.
3. **String Truncation**:
   - Uses the `SUBSTR` function to extract the first 5 characters of the PostalCode field.
4. **Length Calculation**:
   - Measures the total length of the PostalCode field using the `LENGTH` function.
5. **Filtering**:
   - Includes only customers whose `Country` field is "USA."

Definitions:
- **UPPER**: Converts text to all uppercase letters.
- **LOWER**: Converts text to all lowercase letters.
- **SUBSTR**: Extracts a portion of a string based on position and length.
- **LENGTH**: Calculates the length of a string.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query generates a mailing list for US-based customers with formatted names, addresses, and truncated postal codes.
*/

-- The SELECT statement retrieves specific columns, applies formatting, and processes postal codes:
SELECT 
    UPPER(FirstName) AS "First Name (Uppercase)",     -- Converts the first name to uppercase and renames the column.
    LOWER(LastName) AS "Last Name (Lowercase)",       -- Converts the last name to lowercase and renames the column.
    Address,                                          -- Retrieves the customer's street address.
    -- Concatenates the first name, last name, address, city, state, and postal code into a single "Mailing Address" field.
    FirstName || ' ' || LastName || ' ' || Address || ', ' || City || ', ' || State || ', ' || PostalCode AS "Mailing Address",
    LENGTH(PostalCode) AS "Postal Code Length",       -- Calculates the total length of the PostalCode field.
    SUBSTR(PostalCode, 1, 5) AS "5 Digit Postal Code" -- Extracts the first 5 characters of the PostalCode field.
FROM 
    Customer                                          -- Specifies the Customer table as the data source.
WHERE 
    Country = 'USA';                                  -- Filters the results to include only customers located in the USA.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves specific fields from the Customer table:
--      a) `UPPER(FirstName)`: Converts the first name to uppercase.
--      b) `LOWER(LastName)`: Converts the last name to lowercase.
--      c) `Address`: Retrieves the street address.
--    - Concatenates these fields into a single "Mailing Address" field:
--      - Combines FirstName, LastName, Address, City, State, and PostalCode into a readable mailing format.
--      - Example:
--        FirstName || ' ' || LastName || ' ' || Address || ', ' || City || ', ' || State || ', ' || PostalCode
--        Result: "John Doe 123 Main St, New York, NY, 10001"
--    - Measures the length of the PostalCode field using the `LENGTH` function.
--      - Example:
--        LENGTH(PostalCode)
--        PostalCode = "12345-6789" => Result = 10
--    - Truncates the PostalCode field to its first 5 digits using the `SUBSTR` function.
--      - Example:
--        SUBSTR(PostalCode, 1, 5)
--        PostalCode = "12345-6789" => Result = "12345"
-- 2. FROM clause:
--    - Specifies the Customer table as the source of the data.
-- 3. WHERE clause:
--    - Filters the results to include only rows where the `Country` field equals "USA."
-- 4. Result:
--    - Produces a mailing list with formatted names, addresses, and processed postal codes for US-based customers.

-- Example of Table Structure:

-- Customer Table:
-- | CustomerId | FirstName | LastName | Address       | City       | State | PostalCode  | Country |
-- |------------|-----------|----------|---------------|------------|-------|-------------|---------|
-- | 1          | John      | Doe      | 123 Main St   | New York   | NY    | 10001-1234  | USA     |
-- | 2          | Jane      | Smith    | 456 Oak St    | Los Angeles| CA    | 90001-5678  | USA     |
-- | 3          | Mike      | Brown    | 789 Pine Ave  | Chicago    | IL    | 60601       | USA     |

-- After applying the query:
-- | First Name (Uppercase) | Last Name (Lowercase) | Address       | Mailing Address                              | Postal Code Length | 5 Digit Postal Code |
-- |------------------------|-----------------------|---------------|---------------------------------------------|--------------------|----------------------|
-- | JOHN                  | doe                   | 123 Main St   | John Doe 123 Main St, New York, NY, 10001   | 10                 | 10001               |
-- | JANE                  | smith                 | 456 Oak St    | Jane Smith 456 Oak St, Los Angeles, CA, 90001| 10                 | 90001               |
-- | MIKE                  | brown                 | 789 Pine Ave  | Mike Brown 789 Pine Ave, Chicago, IL, 60601 | 5                  | 60601               |

-- Explanation of Results:
-- - Each row includes the customer's formatted name (uppercase first name and lowercase last name), address, mailing address, postal code length, and truncated postal code.

-- Purpose:
-- This query is useful for:
-- - Standardizing customer names for consistency in mailing lists.
-- - Generating postal codes in a format compatible with mailing systems.
-- - Verifying postal code lengths for data validation.

-- Notes:
-- - Ensure that the `UPPER`, `LOWER`, `LENGTH`, and `SUBSTR` functions are supported by your SQL implementation.
--   - In some databases (e.g., MySQL), use `UPPERCASE()` or `LOWERCASE()` for case conversion.
-- - Handle NULL values in postal codes to avoid errors during length calculation or truncation.

-- Alternative Queries:
-- - To include customers from additional countries:
--   WHERE Country IN ('USA', 'Canada');
-- - To group mailing addresses by state and count customers:
--   SELECT State, COUNT(*) AS CustomerCount FROM Customer WHERE Country = 'USA' GROUP BY State;
-- - To exclude incomplete postal codes:
--   WHERE LENGTH(PostalCode) >= 5;
