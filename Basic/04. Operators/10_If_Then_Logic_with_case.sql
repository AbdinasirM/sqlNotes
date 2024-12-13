--Using PEMDAS
SELECT
    InvoiceDate,
	BillingAddress,
	BillingCity,
    Total,
    CASE
    WHEN Total <2.00 THEN "Baseline Purchase"
    WHEN Total BETWEEN 2.00 AND 6.99 THEN "Low Purchase"
    WHEN Total BETWEEN 7.00 AND 15.00 THEN "Target Purchase"
    ELSE  "Top Performer"
    END AS PurchaseType
FROM
    Invoice

WHERE
    PurchaseType = "Top Performer"

ORDER BY invoiceDate;