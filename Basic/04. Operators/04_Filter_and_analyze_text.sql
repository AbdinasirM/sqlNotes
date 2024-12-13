SELECT
    InvoiceDate,
	BillingAddress,
	BillingCity,
    Total
FROM 
    Invoice
WHERE  
    BillingCity IN ("Brussels", "Orlando", "Paris")
ORDER BY invoiceDate;
