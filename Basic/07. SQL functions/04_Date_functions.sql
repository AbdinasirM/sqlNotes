--Calculate the age of all employees

--Date: allows us to manipulate data that is stored in various date and time formats
--strftime

SELECT 
	FirstName,
	LastName,
	BirthDate,
	strftime("%Y/%m/%d",BirthDate) AS [BirthDate NO Timecode],
	strftime("%Y/%m/%d",'now') - strftime("%Y/%m/%d",BirthDate) AS [Age]
FROM Employee

ORDER BY AGE DESC

