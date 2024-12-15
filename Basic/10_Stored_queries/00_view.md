/*
Topic: Understanding Views in SQL

Purpose:
- A **view** in SQL is a virtual table created by saving the result of an SQL query.
- Views simplify complex queries by allowing them to be reused and referenced as if they were tables.
- They are useful for organizing and securing data, as views can limit data exposure by selecting only specific columns or rows.

Key Features:
1. **Reusability**:
   - A view saves a query so it can be reused multiple times without rewriting the SQL logic.
2. **Simplification**:
   - Views abstract complex queries, making them easier to manage and understand.
3. **Security**:
   - Views can limit access to sensitive data by displaying only specific fields or rows.
4. **Independence**:
   - A view is dynamically updated when the underlying table data changes, as it references the latest data.

Definitions:
- **View**: A virtual table based on the result set of an SQL query.
- **CREATE VIEW**: The SQL command used to define a view.
- **DROP VIEW**: The SQL command used to remove a view.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This example demonstrates how to create, use, and manage a view in SQL.
*/

-- Example: Creating a View to Simplify Access to Customer Data
CREATE VIEW CustomerSummary AS -- Defines a view named "CustomerSummary."
SELECT
    CustomerId,
    FirstName,
    LastName,
    Email,
    Country
FROM
    Customer
WHERE
    Country = 'USA';            -- Filters the data to include only customers from the USA.

-- Explanation of the SQL Command Above:
-- 1. CREATE VIEW:
--    - Defines a new view named `CustomerSummary`.
-- 2. SELECT statement:
--    - Retrieves specific columns (`CustomerId`, `FirstName`, `LastName`, `Email`, `Country`) from the `Customer` table.
--    - Filters rows to include only customers whose `Country` is 'USA'.
-- 3. The View:
--    - Acts as a reusable, virtual table for this query result.
--    - Any changes in the `Customer` table (e.g., adding or updating rows) are automatically reflected in the view.

-- Using the View:
-- Once created, the view can be queried just like a regular table:
SELECT * FROM CustomerSummary;

-- Example of Table Structure:

-- Customer Table:
-- | CustomerId | FirstName | LastName  | Email            | Country |
-- |------------|-----------|-----------|------------------|---------|
-- | 1          | John      | Doe       | john.doe@x.com   | USA     |
-- | 2          | Jane      | Smith     | jane.smith@x.com | UK      |
-- | 3          | Mike      | Brown     | mike.brown@x.com | USA     |

-- After querying the view:
-- CustomerSummary:
-- | CustomerId | FirstName | LastName  | Email            | Country |
-- |------------|-----------|-----------|------------------|---------|
-- | 1          | John      | Doe       | john.doe@x.com   | USA     |
-- | 3          | Mike      | Brown     | mike.brown@x.com | USA     |

-- Managing Views:
-- 1. **Updating a View**:
--    - To modify an existing view, use `CREATE OR REPLACE VIEW`:
CREATE OR REPLACE VIEW CustomerSummary AS
SELECT
    CustomerId,
    FirstName,
    LastName,
    Email
FROM
    Customer
WHERE
    Country IN ('USA', 'Canada'); -- Updated logic to include customers from both USA and Canada.

-- 2. **Deleting a View**:
--    - To remove a view, use `DROP VIEW`:
DROP VIEW CustomerSummary;

-- Purpose:
-- Views are useful for:
-- - Simplifying complex queries for repeated use.
-- - Restricting access to specific data for security purposes.
-- - Creating consistent query outputs for reporting or data analysis.

-- Notes:
-- - A view does not store data; it dynamically retrieves data from the underlying tables.
-- - Views can depend on multiple tables by using JOINs in the query definition.

-- Advanced Example:
-- Creating a view for a sales summary by customer:
CREATE VIEW SalesSummary AS
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    SUM(i.Total) AS TotalSpent
FROM
    Customer c
    JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY
    c.CustomerId, c.FirstName, c.LastName;

-- Querying the SalesSummary view:
SELECT * FROM SalesSummary
WHERE TotalSpent > 500;

-- Output Example:
-- | CustomerId | FirstName | LastName  | TotalSpent |
-- |------------|-----------|-----------|------------|
-- | 1          | John      | Doe       | 750.00     |

-- Notes on Advanced Views:
-- - Aggregations and JOINs in views allow for detailed summaries.
-- - Filtering on views simplifies report generation for business insights.

