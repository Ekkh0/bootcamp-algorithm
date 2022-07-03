--1
CREATE VIEW ViewBonus AS
SELECT STUFF(CustomerId, 1, 2, 'BN')[BinusId], CustomerName
FROM MsCustomer
WHERE LEN(CustomerName)>10
GO

--2
CREATE VIEW ViewCustomerData AS
SELECT 
	SUBSTRING(CustomerName, 1, CHARINDEX(' ', CustomerName))[Name],
	CustomerAddress[Address],
	CustomerPhone[Phone]
FROM MsCustomer
WHERE CustomerName LIKE '% %'
GO

--3
CREATE VIEW ViewTreatment AS
SELECT 
	TreatmentName, 
	TreatmentTypeName, 
	'Rp. '+CAST(Price as VARCHAR)[Price]
FROM MsTreatment as Tr
JOIN MsTreatmentType as TrTy ON Tr.TreatmentTypeId=TrTy.TreatmentTypeId
WHERE Price BETWEEN 450000 AND 800000
GO

--4
CREATE VIEW ViewTransaction AS
SELECT 
	StaffName, 
	CustomerName, 
	CONVERT(VARCHAR, TransactionDate, 106)[TransactionDate], 
	PaymentType
FROM HeaderSalonServices as Head
JOIN MsCustomer as Cu ON Head.CustomerId=Cu.CustomerId
JOIN MsStaff as St ON Head.StaffId=St.StaffId
WHERE DAY(TransactionDate) BETWEEN 21 AND 25 AND PaymentType='Credit'
GO

--5
CREATE VIEW ViewBonusCustomer AS
SELECT
	REPLACE(Cu.CustomerId, 'CU', 'BN')[BonusId],
	LOWER(RIGHT(CustomerName, CHARINDEX(' ', REVERSE(CustomerName))-1))[Name],
	DATENAME(WEEKDAY, TransactionDate)[Day],
	CONVERT(VARCHAR, TransactionDate, 101)[TransactionDate]
FROM HeaderSalonServices as Head
JOIN MsCustomer as Cu ON Head.CustomerId=Cu.CustomerId
WHERE CustomerName LIKE '% %' AND CustomerName LIKE '%a'
GO

--6
CREATE VIEW ViewTransactionByLivia AS
SELECT 
	Head.TransactionId,
	CONVERT(VARCHAR, TransactionDate, 106)[Date],
	TreatmentName
FROM HeaderSalonServices as Head
JOIN DetailSalonServices as Det ON Head.TransactionId=Det.TransactionId
JOIN MsTreatment as Tr ON Det.TreatmentId=Tr.TreatmentId
JOIN MsStaff as St ON Head.StaffId=St.StaffId
WHERE DAY(TransactionDate)=21 AND StaffName LIKE 'Livia Ashianti'
GO

--7
ALTER VIEW ViewCustomerData AS
SELECT 
	RIGHT(CustomerId, 3)[ID],
	CustomerName[Name],
	CustomerAddress[Address],
	CustomerPhone[Phone]
FROM MsCustomer
WHERE CustomerName LIKE '% %'
GO

--8
CREATE VIEW ViewCustomer AS
SELECT CustomerId, CustomerName, CustomerGender
FROM MsCustomer
GO

INSERT INTO ViewCustomer
VALUES('CU006', 'Cristian', 'Male')

--9
DELETE FROM ViewCustomerData
WHERE ID='005'

SELECT *
FROM ViewCustomerData

--10
DROP VIEW ViewCustomerData