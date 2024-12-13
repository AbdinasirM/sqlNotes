--INNER JOIN with aliases
SELECT
    c.LastName,
    c.FirstName,
    i.InvoiceId,
    i.CustomerId,
    i.InvoiceDate,
    i.Total

FROM
    Invoice AS i
INNER JOIN
    Customer AS c

ON 
   i.CustomerId = c.CustomerId
ORDER BY c.CustomerId