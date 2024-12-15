-- What is LIMIT?
-- The LIMIT clause is used to restrict the number of rows returned by a query.
-- This is especially useful when working with large datasets where only a subset of the results is needed.
-- The LIMIT value specifies the maximum number of rows to display in the output.

-- Use Case of LIMIT:
-- - To preview a small portion of data.
-- - To improve query performance by reducing the number of rows processed.
-- - To paginate results in an application, showing a fixed number of rows per page.

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query displays all the customers' first names, last names, and email addresses,
limiting the output to only the first 10 results.
*/

-- The SELECT statement retrieves the specified columns, and the LIMIT clause restricts the result to 10 rows:
SELECT 
    FirstName AS [Customer First Name],  -- Renames "FirstName" column to "Customer First Name".
    LastName AS "Customer Last Name",   -- Renames "LastName" column to "Customer Last Name".
    Email AS "Email"                    -- Renames "Email" column to "Email".
FROM CUSTOMER                           -- Retrieves data from the CUSTOMER table.
LIMIT 10;                               -- Restricts the result to the first 10 rows.

-- Explanation of the SQL command above:
-- 1. The SELECT clause retrieves the following columns from the CUSTOMER table: FirstName, LastName, and Email.
-- 2. Aliases (`AS`) are applied to rename the columns for better readability in the output.
-- 3. The LIMIT clause ensures that only the first 10 rows of the query results are returned.

-- Example of results with LIMIT applied:
-- If the CUSTOMER table contains the following data:
-- | FirstName | LastName  | Email                |
-- |-----------|-----------|----------------------|
-- | John      | Doe       | john.doe@example.com |
-- | Jane      | Smith     | jane.smith@example.com |
-- | Sam       | Brown     | sam.brown@example.com |
-- | Adam      | Lee       | adam.lee@example.com |
-- | Chris     | Green     | chris.green@example.com |
-- ... (many more rows)

-- After applying LIMIT 10:
-- | Customer First Name | Customer Last Name | Email                |
-- |---------------------|--------------------|----------------------|
-- | John                | Doe                | john.doe@example.com |
-- | Jane                | Smith              | jane.smith@example.com |
-- | Sam                 | Brown              | sam.brown@example.com |
-- | Adam                | Lee                | adam.lee@example.com |
-- | Chris               | Green              | chris.green@example.com |
-- | ...                 | ...                | ...                  |
-- (Only the first 10 rows are displayed)

-- Notes:
-- - The LIMIT clause is often combined with ORDER BY to control both the order and the number of rows returned.
-- - If no specific order is defined, the database may return rows in any order, so it's good practice to include an ORDER BY clause with LIMIT.
-- - In some databases like SQL Server, `TOP` is used instead of `LIMIT`. Example: `SELECT TOP 10 * FROM CUSTOMER`.

-- Practical Use:
-- - LIMIT is commonly used in applications to fetch a fixed number of rows for pagination (e.g., showing 10 records per page).
-- - This allows efficient handling of large datasets while keeping query results manageable.
