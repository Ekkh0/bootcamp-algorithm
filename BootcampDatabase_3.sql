--1
SELECT MAX(Price)[Maximum Price],
		MIN(Price)[Minimum Price],
		CAST(ROUND(AVG(Price), 0) as decimal(30, 2))[Average Price]
FROM MsTreatment

--2
SELECT StaffPosition,
		LEFT(StaffGender, 1)[Gender],
		'Rp. '+CAST(CAST(AVG(StaffSalary) as decimal(30, 2)) as varchar)[Average Salary]
FROM MsStaff
GROUP BY StaffPosition, StaffGender

--3
SELECT CONVERT(varchar, TransactionDate, 107)[TransactionDate],
		COUNT(TransactionDate)[Total Transaction per Day]
FROM HeaderSalonServices
GROUP BY TransactionDate

--4
SELECT UPPER(CustomerGender)[CustomerGender],
		COUNT(CustomerGender)[Total Transaction]
FROM HeaderSalonServices as He
JOIN MsCustomer as Cu ON He.CustomerId=Cu.CustomerId
GROUP BY CustomerGender

--5
SELECT TreatmentTypeName,
		COUNT(TreatmentTypeName)[Total Transaction]
FROM DetailSalonServices as De
JOIN MsTreatment as Treat ON De.TreatmentId=Treat.TreatmentId
JOIN MsTreatmentType as TrTy ON Treat.TreatmentTypeId=TrTy.TreatmentTypeId
GROUP BY TreatmentTypeName
ORDER BY COUNT(TreatmentTypeName) DESC

--6
SELECT CONVERT(varchar, TransactionDate, 106)[Date],
		'Rp. '+CAST(SUM(Price) as VARCHAR)[Revenue per Day]
FROM HeaderSalonServices as He
JOIN DetailSalonServices as De ON He.TransactionId=De.TransactionId
JOIN MsTreatment as Tr ON Tr.TreatmentId=De.TreatmentId
GROUP BY TransactionDate
HAVING	SUM(Price) BETWEEN 1000000 AND 5000000

--7
SELECT REPLACE(TrTy.TreatmentTypeId, 'TT0', 'Treatment Type ')[ID],
		TreatmentTypeName,
		CAST(COUNT(TreatmentId) as varchar)+' Treatment'[Total treatment per Type]
FROM MsTreatment as Tr
JOIN MsTreatmentType as TrTy ON Tr.TreatmentTypeId=TrTy.TreatmentTypeId
GROUP BY TrTy.TreatmentTypeId, TreatmentTypeName
HAVING COUNT(TrTy.TreatmentTypeId)>5
ORDER BY COUNT(TrTy.TreatmentTypeId) DESC

--8
SELECT LEFT(StaffName, CHARINDEX(' ', StaffName))[StaffName],
		He.TransactionId,
		COUNT(He.TransactionId)[Total Treatment per Transaction]
FROM HeaderSalonServices as He
JOIN MsStaff as St ON He.StaffId=St.StaffId
JOIN DetailSalonServices as De ON He.TransactionId=De.TransactionId
GROUP BY StaffName, He.TransactionId

--9
SELECT TransactionDate,
		CustomerName,
		TreatmentName,
		Price
FROM HeaderSalonServices as He
JOIN MsCustomer as Cu ON He.CustomerId=Cu.CustomerId
JOIN DetailSalonServices as De ON He.TransactionId=De.TransactionId
JOIN MsTreatment as Tr ON De.TreatmentId=Tr.TreatmentId
JOIN MsStaff as St ON He.StaffId=St.StaffId
WHERE DATENAME(WEEKDAY, TransactionDate)='Thursday' AND StaffName LIKE '%Ryan%'
ORDER BY TransactionDate, CustomerName

--10
SELECT TransactionDate,
		CustomerName,
		SUM(Price)[TotalPrice]
FROM HeaderSalonServices as He
JOIN MsCustomer as Cu ON He.CustomerId=Cu.CustomerId
JOIN DetailSalonServices as De ON He.TransactionId=De.TransactionId
JOIN MsTreatment as Tr ON De.TreatmentId=Tr.TreatmentId
WHERE DAY(TransactionDate)>20
GROUP BY CustomerName, TransactionDate
ORDER BY TransactionDate