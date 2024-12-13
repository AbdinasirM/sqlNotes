/*
challenge

Your Task:  
Write a SQL query to generate a report that lists each customer along with their assigned support representative.  

Result:  
A list containing the first and last names of both customers and their assigned support representatives.  

- **CustomerFirstName** field contains the first names of customers  
- **CustomerLastName** field contains the last names of customers  
- **EmployeeFirstName** field contains the first names of support representatives  
- **EmployeeLastName** field contains the last names of support representatives  

Order the results by the support representative's last name, followed by the customer's last name.  

Constraints and Hints:  
- The following tables are to be included:  
  - **Customer**  
  - **Employee**  
- Each table should be aliased as follows:  
  - Customer = c  
  - Employee = e  
- Each field should be aliased as follows:  
  - c.FirstName = CustomerFirstName  
  - c.LastName = CustomerLastName  
  - e.FirstName = SupportRepFirstName  
  - e.LastName = SupportRepLastName  

- Your query syntax should be composed for a MySQL relational database management system.  



*/

/*

CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query generates a report that lists each customer along with their assigned support representative.  


*/
SELECT 
	c.FirstName AS CustomerFirstName,
	c.LastName AS CustomerLastName,
	e.FirstName AS SupportRepFirstName,
	e.LastName AS SupportRepLastName
FROM Customer AS c
INNER JOIN
	Employee AS e
ON 
	c.SupportRepId = e.EmployeeId
ORDER BY e.LastName, c.LastName


