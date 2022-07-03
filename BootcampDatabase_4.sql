--1
SELECT TreatmentId, TreatmentName
FROM MsTreatment
WHERE TreatmentId in ('TM001', 'TM002')

--2
SELECT TreatmentName, Price
FROM MsTreatment as Tr
WHERE TreatmentTypeId in (
	SELECT TreatmentTypeId
	FROM MsTreatmentType
	WHERE TreatmentTypeName not in ('Hair Treatment', 'Message / Spa')
)

--3
SELECT CustomerName, CustomerPhone, CustomerAddress
FROM MsCustomer
WHERE
	len(CustomerName)>8 AND
	CustomerId in(
	SELECT CustomerId
	FROM HeaderSalonServices
	WHERE DATENAME(WEEKDAY, TransactionDate)='Friday'
)

--4
SELECT TreatmentTypeName, TreatmentName, Price
FROM MsTreatment as Tr
JOIN MsTreatmentType as TrTy ON Tr.TreatmentTypeId=TrTy.TreatmentTypeId
WHERE TreatmentId in (
	SELECT TreatmentId
	FROM HeaderSalonServices as Head
	JOIN DetailSalonServices as Det ON Head.TransactionId=Det.TransactionId
	WHERE CustomerId in (
		SELECT CustomerId
		FROM MsCustomer
		WHERE CustomerName LIKE '%Putra%'
	) AND day(TransactionDate)=22
)

--5
SELECT 
	StaffName,
	CustomerName,
	CONVERT(VARCHAR, TransactionDate, 107)[TransactionDate]
FROM HeaderSalonServices as Head
JOIN MsCustomer as Cu ON Head.CustomerId=Cu.CustomerId
JOIN MsStaff as St ON St.StaffId=Head.StaffId
WHERE EXISTS (
	SELECT TransactionId
	FROM DetailSalonServices as Det
	WHERE RIGHT(TreatmentId, 1) in (0, 2, 4, 6, 8) AND
			Head.TransactionId=Det.TransactionId
)

--6
SELECT CustomerName, CustomerPhone, CustomerAddress
FROM MsCustomer as Cu
WHERE EXISTS (
	SELECT *
	FROM HeaderSalonServices as Head
	JOIN MsStaff as St ON Head.StaffId=St.StaffId
	WHERE len(StaffName)%2=1 AND Head.CustomerId=Cu.CustomerId
)

--7
SELECT 
	RIGHT(StaffId, 3)[ID],
	SUBSTRING(
		StaffName, 
		CHARINDEX(' ', StaffName), 
		len(StaffName)-CHARINDEX(' ', REVERSE(StaffName))-CHARINDEX(' ', StaffName)+1
	)[Name]
FROM MsStaff as St
WHERE EXISTS (
	SELECT *
	FROM HeaderSalonServices as Head
	WHERE Head.CustomerId in(
		SELECT CustomerId
		FROM MsCustomer as Cu
		WHERE CustomerGender not like 'Male'
	) AND Head.StaffId=St.StaffId
) AND StaffName like '% % %'

--8
SELECT TreatmentTypeName, TreatmentName, Price
FROM MsTreatmentType as TrTy
JOIN MsTreatment as Tr ON Tr.TreatmentTypeId=TrTy.TreatmentTypeId
WHERE Price>(
	SELECT AVG(Price)
	FROM MsTreatment
)

--9
SELECT StaffName, StaffPosition, StaffSalary
FROM MsStaff
WHERE StaffSalary=(
	SELECT MAX(StaffSalary)
	FROM MsStaff
) OR StaffSalary=(
	SELECT MIN(StaffSalary)
	FROM MsStaff
)

--10
SELECT CustomerName, CustomerPhone, CustomerAddress, [Count Treatment]
FROM MsCustomer as Cu
JOIN (
	SELECT CustomerId, COUNT(Head.TransactionId)[Count Treatment]
	FROM HeaderSalonServices as Head
	JOIN DetailSalonServices as Det ON Head.TransactionId=Det.TransactionId
	GROUP BY Head.TransactionId, CustomerId
) a ON a.CustomerId=Cu.CustomerId
WHERE [Count Treatment]=(
	SELECT MAX([Count Treatment])
	FROM MsCustomer as Cu
	JOIN (
		SELECT CustomerId, COUNT(Head.TransactionId)[Count Treatment]
		FROM HeaderSalonServices as Head
		JOIN DetailSalonServices as Det ON Head.TransactionId=Det.TransactionId
		GROUP BY Head.TransactionId, CustomerId
	) a ON a.CustomerId=Cu.CustomerId
)