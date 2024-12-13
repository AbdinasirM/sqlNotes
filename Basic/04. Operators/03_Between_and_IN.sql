SELECT
    InvoiceDate,
	BillingAddress,
	BillingCity,
    Total
FROM 
    Invoice
WHERE  Total BETWEEN 1.98 AND 5.00
ORDER BY invoiceDate;


SELECT
    InvoiceDate,
	BillingAddress,
	BillingCity,
    Total
FROM 
    Invoice
WHERE  Total IN (1.98, 3.96)
ORDER BY invoiceDate;
