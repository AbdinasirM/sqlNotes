--Left Outer JOIN: combines all the data from the left table with any matchin record in the right table
--Left Outer JOIN with aliases
SELECT
    c.LastName,
    c.FirstName,
    i.InvoiceId,
    i.CustomerId,
    i.InvoiceDate,
    i.Total

FROM
    Invoice AS i
LEFT OUTER JOIN
    Customer AS c

ON 
   i.CustomerId = c.CustomerId
ORDER BY c.CustomerId