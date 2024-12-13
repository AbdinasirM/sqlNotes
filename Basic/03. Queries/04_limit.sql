-- LIMIT: is used to limit result after querying it from the database 
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

LIMIT 10



--Explain the SQL command above
