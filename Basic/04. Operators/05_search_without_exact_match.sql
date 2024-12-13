--Using the LIKE operator it uses % sign

--qury for cities that have B in start of their name
--% SAYS I dont care what comes after me
SELECT
    InvoiceDate,
	BillingAddress,
	BillingCity,
    Total
FROM 
    Invoice
WHERE  
    BillingCity LIKE 'B%'
ORDER BY invoiceDate;

--Cities that have B in their name
SELECT
    InvoiceDate,
	BillingAddress,
	BillingCity,
    Total
FROM 
    Invoice
WHERE  
    BillingCity LIKE '%B%'
ORDER BY invoiceDate;
