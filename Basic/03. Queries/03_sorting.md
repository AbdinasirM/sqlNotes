-- What is ORDER BY?
-- The ORDER BY clause is used to sort the results of a query in either ascending or descending order.
-- Sorting makes it easier to analyze and organize data.
-- By default, ORDER BY sorts in ascending order (A to Z for text, smallest to largest for numbers).

-- Sorting Options:
-- 1. ASC (Ascending): Sorts the data in increasing order (A to Z for text, 1 to 10 for numbers).
-- 2. DESC (Descending): Sorts the data in decreasing order (Z to A for text, 10 to 1 for numbers).

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query displays all the customers' first names, last names, and email addresses 
and sorts the results based on various criteria.
*/

-- Sort the result by FirstName (default is ascending A-Z):
SELECT 
    FirstName AS [Customer First Name],  -- Renames "FirstName" column to "Customer First Name".
    LastName AS "Customer Last Name",   -- Renames "LastName" column to "Customer Last Name".
    Email AS "Email"                    -- Renames "Email" column to "Email".
FROM CUSTOMER
ORDER BY FirstName;                     -- Sorts the results by the "FirstName" column in ascending order (A-Z).

-- Sort the result by FirstName in explicit Ascending (A-Z):
SELECT 
    FirstName AS [Customer First Name], 
    LastName AS "Customer Last Name",
    Email AS "Email"
FROM CUSTOMER
ORDER BY FirstName ASC;                 -- ASC explicitly sorts the results in ascending order.

-- Sort the result by FirstName in Descending (Z-A):
SELECT 
    FirstName AS [Customer First Name], 
    LastName AS "Customer Last Name",
    Email AS "Email"
FROM CUSTOMER
ORDER BY FirstName DESC;                -- DESC sorts the results in descending order (Z-A).

-- Sort the result by FirstName in Ascending (A-Z) and LastName in Descending (Z-A):
SELECT 
    FirstName AS [Customer First Name], 
    LastName AS "Customer Last Name",
    Email AS "Email"
FROM CUSTOMER
ORDER BY 
    FirstName ASC,                      -- Sorts by "FirstName" in ascending order first.
    LastName DESC;                      -- Then sorts by "LastName" in descending order (if FirstNames are identical).

-- Explanation of the SQL commands above:
-- 1. The SELECT clause retrieves the specified columns: FirstName, LastName, and Email.
-- 2. Aliases (`AS`) are applied to make the column names more readable in the output.
-- 3. The ORDER BY clause specifies how the rows should be sorted in the result set:
--    - Sorting can be done on one column (e.g., FirstName) or multiple columns (e.g., FirstName and LastName).
--    - ASC and DESC determine the order of sorting.

-- Example of results:
-- If the CUSTOMER table contains the following data:
-- | FirstName | LastName  | Email                |
-- |-----------|-----------|----------------------|
-- | John      | Doe       | john.doe@example.com |
-- | Jane      | Smith     | jane.smith@example.com |
-- | Sam       | Brown     | sam.brown@example.com |
-- | Adam      | Lee       | adam.lee@example.com |

-- After applying ORDER BY FirstName ASC:
-- | Customer First Name | Customer Last Name | Email                |
-- |---------------------|--------------------|----------------------|
-- | Adam                | Lee                | adam.lee@example.com |
-- | Jane                | Smith              | jane.smith@example.com |
-- | John                | Doe                | john.doe@example.com |
-- | Sam                 | Brown              | sam.brown@example.com |

-- After applying ORDER BY FirstName ASC, LastName DESC:
-- | Customer First Name | Customer Last Name | Email                |
-- |---------------------|--------------------|----------------------|
-- | Adam                | Lee                | adam.lee@example.com |
-- | Jane                | Smith              | jane.smith@example.com |
-- | John                | Doe                | john.doe@example.com |
-- | Sam                 | Brown              | sam.brown@example.com |

-- Notes:
-- - Multiple columns in ORDER BY are processed in sequence: FirstName is sorted first, and if there are ties, LastName is sorted next.
-- - Always specify ASC or DESC explicitly if clarity is needed.
-- - Using ORDER BY improves the organization of your query results.
