-- What is a Query?
-- A query is a request made to a database to retrieve or manipulate data. 
-- It allows you to fetch specific information, update existing data, or perform actions like inserting or deleting records.

-- What is SELECT and FROM?
-- The SELECT statement is used to specify the columns (fields) you want to retrieve from the database.
-- The FROM clause specifies the table from which the data will be retrieved.

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query displays all the customers' first names, last names, and email addresses.
*/

-- The SELECT clause is used here to specify the columns we want to retrieve:
-- 1. FirstName: Retrieves the first name of the customer.
-- 2. LastName: Retrieves the last name of the customer.
-- 3. Email: Retrieves the customer's email address.
SELECT 
    FirstName,  -- This selects the first name column from the CUSTOMER table.
    LastName,   -- This selects the last name column from the CUSTOMER table.
    Email       -- This selects the email column from the CUSTOMER table.
FROM CUSTOMER  -- Specifies the CUSTOMER table as the source of the data.

-- Explanation of the SQL command above:
-- 1. The query retrieves data from the CUSTOMER table in the database.
-- 2. It fetches the first name, last name, and email of each customer stored in the CUSTOMER table.
-- 3. The result will display a list of customers, showing only the three specified columns (FirstName, LastName, Email).

-- Example of what the result might look like:
-- | FirstName | LastName  | Email                |
-- |-----------|-----------|----------------------|
-- | John      | Doe       | john.doe@example.com |
-- | Jane      | Smith     | jane.smith@example.com |
-- | Sam       | Brown     | sam.brown@example.com |

-- This query is useful when you only need specific details from the CUSTOMER table, 
-- rather than fetching all the columns or unnecessary data.
