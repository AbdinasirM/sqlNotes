--INNER JOIN
SELECT
    *
FROM
    Invoice
INNER JOIN
    Customer

ON 
   Invoice.CustomerId = Customer.CustomerId
ORDER BY Customer.CustomerId