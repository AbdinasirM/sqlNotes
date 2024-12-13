--RIGHT Outer JOIN: combines all the data from the right table with any matchin record in the left table
--RIGHT Outer JOIN with aliases
SELECT
    c.LastName,
    c.FirstName,
    i.InvoiceId,
    i.CustomerId,
    i.InvoiceDate,
    i.Total

FROM
    Invoice AS i
RIGHT OUTER JOIN
    Customer AS c

ON 
   i.CustomerId = c.CustomerId
ORDER BY c.CustomerId