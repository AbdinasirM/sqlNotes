/*
Topic: Data Manipulation Language (DML) in SQL

Purpose:
- **DML** stands for Data Manipulation Language, a subset of SQL used to interact with and modify the data stored in database tables.
- DML statements enable users to **insert**, **update**, **delete**, and **retrieve** data from a database.

Key Features:
1. **Data Manipulation**:
   - DML focuses on the data stored in tables, allowing users to add, update, or remove data as needed.
2. **Transactional Control**:
   - DML statements are often used with transactions, enabling users to commit or roll back changes.
3. **Data Retrieval**:
   - Although often associated with modifying data, the `SELECT` statement (for retrieving data) is also considered a part of DML.

Definitions:
- **INSERT**: Adds new rows to a table.
- **UPDATE**: Modifies existing rows in a table.
- **DELETE**: Removes rows from a table.
- **SELECT**: Retrieves data from one or more tables.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This script demonstrates the key DML operations (`INSERT`, `UPDATE`, `DELETE`, `SELECT`) for managing data in SQL tables.
*/

-- Example Table Structure:
-- Assume we are working with a `Customer` table:
-- | CustomerId | FirstName | LastName  | Email              | Country |
-- |------------|-----------|-----------|--------------------|---------|
-- | 1          | John      | Doe       | john.doe@example.com | USA     |
-- | 2          | Jane      | Smith     | jane.smith@example.com | UK      |

-- DML Operations:

-- 1. INSERT: Adding New Rows to the Table
INSERT INTO Customer (CustomerId, FirstName, LastName, Email, Country)
VALUES (3, 'Mike', 'Brown', 'mike.brown@example.com', 'Canada');

-- Explanation:
-- - Adds a new row to the `Customer` table with the provided values for `CustomerId`, `FirstName`, `LastName`, `Email`, and `Country`.

-- Result After INSERT:
-- | CustomerId | FirstName | LastName  | Email                  | Country |
-- |------------|-----------|-----------|------------------------|---------|
-- | 1          | John      | Doe       | john.doe@example.com   | USA     |
-- | 2          | Jane      | Smith     | jane.smith@example.com | UK      |
-- | 3          | Mike      | Brown     | mike.brown@example.com | Canada  |

-- 2. UPDATE: Modifying Existing Rows
UPDATE Customer
SET Email = 'mike.updated@example.com', Country = 'USA'
WHERE CustomerId = 3;

-- Explanation:
-- - Updates the email and country of the customer with `CustomerId = 3`.

-- Result After UPDATE:
-- | CustomerId | FirstName | LastName  | Email                  | Country |
-- |------------|-----------|-----------|------------------------|---------|
-- | 1          | John      | Doe       | john.doe@example.com   | USA     |
-- | 2          | Jane      | Smith     | jane.smith@example.com | UK      |
-- | 3          | Mike      | Brown     | mike.updated@example.com | USA   |

-- 3. DELETE: Removing Rows from the Table
DELETE FROM Customer
WHERE CustomerId = 2;

-- Explanation:
-- - Removes the row for the customer with `CustomerId = 2`.

-- Result After DELETE:
-- | CustomerId | FirstName | LastName  | Email                  | Country |
-- |------------|-----------|-----------|------------------------|---------|
-- | 1          | John      | Doe       | john.doe@example.com   | USA     |
-- | 3          | Mike      | Brown     | mike.updated@example.com | USA   |

-- 4. SELECT: Retrieving Data from the Table
SELECT CustomerId, FirstName, LastName, Country
FROM Customer
WHERE Country = 'USA';

-- Explanation:
-- - Retrieves `CustomerId`, `FirstName`, `LastName`, and `Country` for customers located in the USA.

-- Query Result:
-- | CustomerId | FirstName | LastName | Country |
-- |------------|-----------|----------|---------|
-- | 1          | John      | Doe      | USA     |
-- | 3          | Mike      | Brown    | USA     |

-- Purpose:
-- DML operations are essential for:
-- - Adding, modifying, and deleting records in a database.
-- - Ensuring that data remains accurate and up to date.
-- - Retrieving specific subsets of data for analysis or reporting.

-- Notes:
-- - Always use a `WHERE` clause with `UPDATE` and `DELETE` statements to avoid unintended changes or deletions.
-- - DML operations often work with **transactions** to ensure data integrity:
--   - Use `BEGIN TRANSACTION` to start a transaction.
--   - Use `COMMIT` to save changes permanently.
--   - Use `ROLLBACK` to undo changes if necessary.

-- Example with Transaction Control:
BEGIN TRANSACTION;

INSERT INTO Customer (CustomerId, FirstName, LastName, Email, Country)
VALUES (4, 'Alice', 'Williams', 'alice.williams@example.com', 'UK');

ROLLBACK; -- Undoes the insert operation, leaving the table unchanged.

-- Alternative Queries:
-- - To retrieve all customers from a specific country:
--   SELECT * FROM Customer WHERE Country = 'Canada';
-- - To delete all customers from a specific country:
--   DELETE FROM Customer WHERE Country = 'Canada';
-- - To update multiple rows with the same criteria:
--   UPDATE Customer SET Country = 'International' WHERE Country IN ('USA', 'UK');
