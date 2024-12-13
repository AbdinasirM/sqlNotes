SELECT
    InvoiceDate,
	BillingAddress,
	BillingCity,
    Total
FROM 
    Invoice
WHERE  
    InvoiceDate = "2010-05-22 00:00:00"
ORDER BY invoiceDate;
