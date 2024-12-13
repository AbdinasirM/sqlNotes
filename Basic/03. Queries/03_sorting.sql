-- ORDERBY: is used to sort a result after querying it from the database and it can be Ascending(A to Z) or Descending(Z to A)
-- 

/*

CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query displays all the customers firstname,  lastname, email addresses

*/
--Sort the result by firstname  
SELECT 
    FirstName AS [Customer First Name], 
    LastName AS "Customer Last Name",
    Email AS "Email"
FROM CUSTOMER 

ORDER BY FirstName

--Sort the result by firstname  A-Z
SELECT 
    FirstName AS [Customer First Name], 
    LastName AS "Customer Last Name",
    Email AS "Email"
FROM CUSTOMER 

    FirstName ASC

--Sort the result by firstname  Z-A
SELECT 
    FirstName AS [Customer First Name], 
    LastName AS "Customer Last Name",
    Email AS "Email"
FROM CUSTOMER 

    FirstName DESC


--Sort the result by firstname A-Z and last name  Z-A
SELECT 
    FirstName AS [Customer First Name], 
    LastName AS "Customer Last Name",
    Email AS "Email"
FROM CUSTOMER 

    FirstName ASC
    LastName DESC

--Explain the SQL command above
