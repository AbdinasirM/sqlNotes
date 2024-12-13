SELECT
	e.FirstName,
	e.LastName,
	e.EmployeeId,
	c.FirstName,
	c.LastName,
	c.SupportRepId,
	i.total
FROM 
    Invoice AS i
INNER JOIN
    Customer AS c
ON 
    i.CustomerId = c.CustomerId
INNER JOIN
    Employee AS e
ON 
    c.SupportRepId = e.EmployeeId

ORDER BY 
    i.Total DESC
LIMIT 10
