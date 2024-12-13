--Creating a mailing list of US Customers

--upper: makes the text all upper case
--lower: makes the text all lower case

SELECT 
	upper(FirstName),
	lower(LastName),
	Address,
	FirstName ||' '||  LastName || ' ' || Address || ',' || City || '' || State ||',' ||PostalCode AS "Mailing Address",
    LENGTH(PostalCode),
    substr(PostalCode, 1,5) AS "5 Digit Postal Code"

	
FROM Customer

WHERE 
	Country = 'USA'