/*
challenge

Task: Write SQL that selects track names, composers and unit prices and categories each track based on its price.

Price Categories:
Budget: Tracks priced at $0.99 or less
Regular: Tracks priced between $1.00 and $1.49
Premium: Tracks priced between $1.50 and $1.99
Exclusive: Tracks priced above $1.99

Result:
A list containing Four columns: Name, unit price, and a new column named PriceCategory

    The name feild contains a list of track names.
    The composer feild  contains who composed the track.
    The unit price feild contains unit cost of each track.
    PriceCategory feild contains categories as defined above in Price Categories.
    The results should be ordered by the UnitPrice in ascending order.
    State the purpose of the query
*
/


/*

CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query selects track names, composers and unit prices and categories each track based on its price.

*/

SELECT 
    Name AS "Track Name",
    Composer AS "COMPOSER",
    UnitPrice AS "PRICE",
    CASE
        WHEN UnitPrice  <= 0.99 THEN 'Budget'
        WHEN UnitPrice  BETWEEN 1.00 AND  1.49 THEN 'Regular'
        WHEN UnitPrice  BETWEEN 1.50 AND 1.99 THEN 'Premium'
        ELSE 'Exclusive'
    END AS "PRICECATEGORY"

FROM Track 

ORDER BY
    UnitPrice ASC