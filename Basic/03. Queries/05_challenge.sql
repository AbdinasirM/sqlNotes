/*
Task: Generate a report listing track names alongside their unit prices
Result:
A list containing Two columns: Track Name and Price

Track Name feild contains a list of track names
The price feild contains the UnitPrice of each track
it must only include the first 20 tracks, sorted by track name
state the purpose of the query

*
/


/*

CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query Generates a report listing track names alongside their unit prices

*/
SELECT 
    Name AS "Track Name",
    UnitPrice AS "PRICE",
FROM Track 
ORDER BY
    Name
LIMIT
    20;
