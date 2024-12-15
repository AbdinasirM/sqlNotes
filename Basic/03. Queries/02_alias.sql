-- What is an Alias?
-- An alias is a custom name assigned to a column or table to make it more readable or user-friendly.
-- Aliases are often used to rename columns in the result set or to simplify table references in complex queries.

-- How to Create an Alias:
-- 1. Use the `AS` keyword followed by the custom name you want to assign.
-- 2. Enclose the custom name in square brackets `[]` or double quotes `""` if it contains spaces or special characters.

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query displays all the customers' first names, last names, and email addresses, 
renaming the column headers for better readability in the output.
*/

-- The SELECT statement retrieves data from the CUSTOMER table and renames the columns as follows:
SELECT 
    FirstName AS [Customer First Name],   -- Renames the "FirstName" column to "Customer First Name".
    LastName AS "Customer Last Name",    -- Renames the "LastName" column to "Customer Last Name".
    Email AS "Email"                     -- Renames the "Email" column to simply "Email".
FROM CUSTOMER                            -- Specifies the CUSTOMER table as the source of the data.

-- Explanation of the SQL command above:
-- 1. The SELECT clause retrieves specific columns from the CUSTOMER table: FirstName, LastName, and Email.
-- 2. The `AS` keyword creates an alias for each column, changing the column headers in the result set:
--    - FirstName becomes "Customer First Name".
--    - LastName becomes "Customer Last Name".
--    - Email remains "Email".
-- 3. The FROM clause indicates that the data is being fetched from the CUSTOMER table.

-- Example of the result with aliases applied:
-- | Customer First Name | Customer Last Name | Email                |
-- |---------------------|--------------------|----------------------|
-- | John                | Doe                | john.doe@example.com |
-- | Jane                | Smith              | jane.smith@example.com |
-- | Sam                 | Brown              | sam.brown@example.com |

-- Why Use Aliases?
-- - Improves readability of the output by using user-friendly column names.
-- - Simplifies understanding of the data for end users or when exporting results.
-- - Allows for customization of column names without altering the database structure.

-- Notes:
-- - Square brackets `[]` or double quotes `""` are required if the alias contains spaces, special characters, or reserved keywords.
-- - Aliases only affect the query result; the actual column names in the database remain unchanged.
