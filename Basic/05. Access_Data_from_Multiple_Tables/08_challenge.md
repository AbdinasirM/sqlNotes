/*
Challenge

Your Task:  
Write a SQL query to generate a report that lists each customer along with their assigned support representative.

Result:  
- A list containing the first and last names of both customers and their assigned support representatives.  
- Fields in the result:
  - **CustomerFirstName**: Contains the first names of customers.
  - **CustomerLastName**: Contains the last names of customers.
  - **SupportRepFirstName**: Contains the first names of support representatives.
  - **SupportRepLastName**: Contains the last names of support representatives.

Ordering:
- Results are ordered by:
  1. Support representative's last name (ascending).
  2. Customer's last name (ascending).

Constraints and Hints:
- Tables included:
  - **Customer** (aliased as `c`).
  - **Employee** (aliased as `e`).
- Aliases for fields:
  - c.FirstName = CustomerFirstName.
  - c.LastName = CustomerLastName.
  - e.FirstName = SupportRepFirstName.
  - e.LastName = SupportRepLastName.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query generates a report that lists each customer along with their assigned support representative.
*/

-- The SELECT statement retrieves specific columns from the Customer and Employee tables:
SELECT 
    c.FirstName AS CustomerFirstName,          -- Retrieves the first name of the customer and renames the column.
    c.LastName AS CustomerLastName,            -- Retrieves the last name of the customer and renames the column.
    e.FirstName AS SupportRepFirstName,        -- Retrieves the first name of the support representative and renames the column.
    e.LastName AS SupportRepLastName           -- Retrieves the last name of the support representative and renames the column.
FROM 
    Customer AS c                              -- Assigns the alias `c` to the Customer table.
INNER JOIN
    Employee AS e                              -- Assigns the alias `e` to the Employee table.
ON 
    c.SupportRepId = e.EmployeeId              -- Matches rows where SupportRepId in Customer matches EmployeeId in Employee.
ORDER BY 
    e.LastName,                                -- Sorts the results by the support representative's last name in ascending order.
    c.LastName;                                -- Within each support representative, sorts by the customer's last name in ascending order.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves specific columns from the Customer (alias `c`) and Employee (alias `e`) tables.
--    - Fields are renamed to clearly indicate their purpose in the result set.
--      a) CustomerFirstName: Customer's first name.
--      b) CustomerLastName: Customer's last name.
--      c) SupportRepFirstName: Support representative's first name.
--      d) SupportRepLastName: Support representative's last name.
-- 2. FROM clause:
--    - Specifies the Customer table as the primary data source and assigns it the alias `c`.
-- 3. INNER JOIN:
--    - Combines rows from the Customer (`c`) and Employee (`e`) tables.
--    - Ensures only rows with matching values in `c.SupportRepId` (foreign key) and `e.EmployeeId` (primary key) are included in the result.
-- 4. ON clause:
--    - Defines the relationship between the Customer and Employee tables using the `SupportRepId` and `EmployeeId` columns.
-- 5. ORDER BY clause:
--    - Sorts the results first by the support representative's last name (`e.LastName`) in ascending order.
--    - Within each support representative, sorts by the customer's last name (`c.LastName`) in ascending order.

-- Example of Table Structures:

-- Customer Table (alias: c):
-- | CustomerId | FirstName | LastName | SupportRepId |
-- |------------|-----------|----------|--------------|
-- | 1          | John      | Doe      | 101          |
-- | 2          | Jane      | Smith    | 102          |
-- | 3          | Sam       | Brown    | 101          |

-- Employee Table (alias: e):
-- | EmployeeId | FirstName | LastName |
-- |------------|-----------|----------|
-- | 101        | Lisa      | Taylor   |
-- | 102        | Mark      | Johnson  |

-- After applying INNER JOIN:
-- | CustomerFirstName | CustomerLastName | SupportRepFirstName | SupportRepLastName |
-- |-------------------|------------------|---------------------|--------------------|
-- | John              | Doe             | Lisa                | Taylor             |
-- | Sam               | Brown           | Lisa                | Taylor             |
-- | Jane              | Smith           | Mark                | Johnson            |

-- Explanation of Results:
-- - Customers are matched with their assigned support representatives.
-- - All rows represent relationships where a customer is assigned to a specific support representative.

-- Purpose:
-- This query is useful for:
-- - Generating reports to analyze customer relationships with their support representatives.
-- - Identifying which customers are assigned to specific employees.
-- - Organizing data for customer service and support team management.

-- Notes:
-- - INNER JOIN excludes rows where a customer does not have a support representative assigned.
-- - To include all customers, even those without a support representative, use a LEFT OUTER JOIN.

-- Alternative Queries:
-- - To count the number of customers assigned to each support representative:
--   SELECT e.LastName AS SupportRepLastName, COUNT(c.CustomerId) AS CustomerCount
--   FROM Customer AS c
--   INNER JOIN Employee AS e ON c.SupportRepId = e.EmployeeId
--   GROUP BY e.LastName;
-- - To filter for a specific support representative:
--   WHERE e.EmployeeId = 101
--   ORDER BY c.LastName;
