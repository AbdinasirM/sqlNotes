SELECT
    InvoiceDate,
	BillingAddress,
	BillingCity,
    Total
FROM
    Invoice

WHERE
    BillingCity LIKE "P%" OR BillingCity LIKE "D%"

ORDER BY invoiceDate;