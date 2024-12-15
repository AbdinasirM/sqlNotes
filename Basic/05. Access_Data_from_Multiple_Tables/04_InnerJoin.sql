/*
Topic: Understanding INNER JOIN

INNER JOIN:
- The INNER JOIN clause is used to combine rows from two or more tables based on a related column between them.
- It only returns rows where there is a match in both tables.
- Any unmatched data from either table is excluded from the results.

Key Feature:
- **Matching Records Only**: Rows with matching values in the specified columns of both tables are included.
- **Unmatched Data Ignored**: Rows without corresponding matches in either table are excluded.

Example Scenario:
Imagine a relational database for an e-commerce store with the following tables:
1. **Orders**: Contains information about orders.
2. **Customers**: Contains information about customers.

The relationship:
- The **Orders** table has a foreign key `CustomerID` that links to the primary key `CustomerID` in the **Customers** table.

Task:
- Retrieve a list of orders along with the corresponding customer details.
- Include only orders that have matching customer records.

Purpose:
To demonstrate how INNER JOIN retrieves only the matching records between related tables.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves matching records from the Orders and Customers tables based on CustomerID.
*/

-- The SELECT statement retrieves specific columns from the Orders and Customers tables:
SELECT
    o.OrderID AS "Order ID",           -- Retrieves the OrderID column from the Orders table and renames it.
    o.OrderDate AS "Order Date",       -- Retrieves the OrderDate column from the Orders table and renames it.
    o.TotalAmount AS "Order Total",    -- Retrieves the TotalAmount column from the Orders table and renames it.
    c.CustomerID AS "Customer ID",     -- Retrieves the CustomerID column from the Customers table and renames it.
    c.FirstName AS "Customer First Name", -- Retrieves the FirstName column from the Customers table and renames it.
    c.LastName AS "Customer Last Name" -- Retrieves the LastName column from the Customers table and renames it.
FROM
    Orders AS o                        -- Assigns the alias `o` to the Orders table.
INNER JOIN
    Customers AS c                     -- Assigns the alias `c` to the Customers table.
ON 
    o.CustomerID = c.CustomerID        -- Matches rows where CustomerID in both tables is the same.

-- Example of Table Structures:

-- Orders Table (alias: o):
-- | OrderID | CustomerID | OrderDate          | TotalAmount |
-- |---------|------------|--------------------|-------------|
-- | 1       | 101        | 2024-12-10 00:00  | 150.00      |
-- | 2       | 102        | 2024-12-11 00:00  | 200.00      |
-- | 3       | 104        | 2024-12-12 00:00  | 250.00      |

-- Customers Table (alias: c):
-- | CustomerID | FirstName  | LastName   |
-- |------------|------------|------------|
-- | 101        | John       | Doe        |
-- | 102        | Jane       | Smith      |
-- | 103        | Sam        | Brown      |

-- After applying INNER JOIN:
-- | Order ID | Order Date          | Order Total | Customer ID | Customer First Name | Customer Last Name |
-- |----------|---------------------|-------------|-------------|---------------------|--------------------|
-- | 1        | 2024-12-10 00:00   | 150.00      | 101         | John                | Doe                |
-- | 2        | 2024-12-11 00:00   | 200.00      | 102         | Jane                | Smith              |

-- Explanation of Results:
-- - The order with OrderID 3 is excluded because there is no matching CustomerID in the Customers table.
-- - Only rows with matching CustomerID values in both tables are included.

-- Purpose:
-- This query demonstrates how INNER JOIN retrieves combined data from multiple tables based o
