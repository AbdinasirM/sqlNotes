--Creating a mailing list of US Customers

--concatinate: linking things together in a chain of series

SELECT 
	FirstName,
	LastName,
	Address,
	FirstName ||' '||  LastName || ' ' || Address || ',' || City || '' || State ||',' ||PostalCode AS "Mailing Address"
	
FROM Customer

WHERE 
	Country = 'USA'