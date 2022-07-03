--1
SELECT *
FROM MsStaff
WHERE StaffGender='Female'

--2
SELECT StaffName, 'Rp. '+CAST(StaffSalary as VARCHAR)[StaffSalary]
FROM MsStaff
WHERE StaffName LIKE 'm%' AND StaffSalary>=10000000

--3
SELECT TreatmentName, Price
FROM MsTreatment
WHERE TreatmentTypeId in ('TT002', 'TT003')

--4
SELECT StaffName, StaffPosition, CONVERT(varchar, TransactionDate, 107)[TransactionDate]
FROM MsStaff as St
JOIN HeaderSalonServices as Head ON St.StaffId=Head.StaffId
WHERE St.StaffSalary BETWEEN 7000000 AND 10000000

--5
SELECT SUBSTRING(CustomerName, 1, CHARINDEX(' ', CustomerName)-1)[Name], LEFT(CustomerGender, 1)[Gender], PaymentType
FROM MsCustomer as Cu
JOIN HeaderSalonServices as Head ON Cu.CustomerId=Head.CustomerId
WHERE PaymentType='Debit'

--6
SELECT UPPER(CONCAT(Left(CustomerName, 1), SUBSTRING(CustomerName, CHARINDEX(' ', CustomerName)+1, 1)))[Initial],
		DATENAME(WEEKDAY, TransactionDate)[Day]
FROM MsCustomer as Cu
JOIN HeaderSalonServices as Head ON Cu.CustomerId=Head.CustomerId
WHERE datediff(day, Head.TransactionDate, '2012/12/24')<3

--7
SELECT TransactionDate,
		RIGHT(CustomerName, (CHARINDEX(' ', REVERSE(CustomerName))-1))[CustomerName]
FROM MsCustomer as Cu
JOIN HeaderSalonServices as Head ON Cu.CustomerId=Head.CustomerId
WHERE CustomerName LIKE '% %' AND DATENAME(WEEKDAY, TransactionDate)='Saturday'

--8
SELECT StaffName, CustomerName, REPLACE(CustomerPhone, '0', '+62')[CustomerPhone], CustomerAddress
FROM MsCustomer as Cu
JOIN HeaderSalonServices as Head ON Cu.CustomerId=Head.CustomerId
JOIN MsStaff as St ON Head.StaffId=St.StaffId
WHERE StaffName LIKE '% % %' AND
		(CustomerName LIKE 'A%' OR
		CustomerName LIKE 'I%' OR
		CustomerName LIKE 'U%' OR
		CustomerName LIKE 'E%' OR
		CustomerName LIKE 'O%')

--9
SELECT StaffName, TreatmentName, DATEDIFF(DAY, TransactionDate, '2012/12/24')[Term of Transaction]
FROM DetailSalonServices as Det
JOIN MsTreatment as Tr ON Tr.TreatmentId=Det.TreatmentId
JOIN HeaderSalonServices as Head ON Head.TransactionId=Det.TransactionId
JOIN MsStaff as St ON Head.StaffId=St.StaffId
WHERE LEN(TreatmentName)>20 OR TreatmentName LIKE '% %'

--10
SELECT TransactionDate, CustomerName, TreatmentName, CAST(Price AS int)*20/100[Discount], PaymentType
FROM DetailSalonServices as Det
JOIN MsTreatment as Tr ON Tr.TreatmentId=Det.TreatmentId
JOIN HeaderSalonServices as Head ON Head.TransactionId=Det.TransactionId
JOIN MsCustomer as Cu ON Head.CustomerId=Cu.CustomerId
WHERE day(TransactionDate)=22