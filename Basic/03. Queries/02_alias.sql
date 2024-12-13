-- what is a alias: alias is basically creating a custom name for column name
-- 

/*

CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query displays all the customers firstname,  lastname, email addresses

*/

SELECT 
    FirstName AS [Customer First Name], 
    LastName AS "Customer Last Name",
    Email AS "Email"
FROM CUSTOMER 

--Explain the SQL command above
