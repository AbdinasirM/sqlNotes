--Using PEMDAS
SELECT
    InvoiceDate,
	BillingAddress,
	BillingCity,
    Total
FROM
    Invoice

WHERE
    Total > 1.98 AND (BillingCity LIKE "P%" OR BillingCity LIKE "D%")

ORDER BY invoiceDate;