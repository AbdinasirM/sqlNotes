--Creating a mailing list of US Customers

--Truncate: To shorten or reduce
--SUBSTR: used to truncate strings of text

SELECT 
	FirstName,
	LastName,
	Address,
	FirstName ||' '||  LastName || ' ' || Address || ',' || City || '' || State ||',' ||PostalCode AS "Mailing Address",
    substr(PostalCode, 1,5) AS "5 Digit Postal Code"

	
FROM Customer

WHERE 
	Country = 'USA'