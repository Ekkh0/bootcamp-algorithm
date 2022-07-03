--1
CREATE OR ALTER PROCEDURE sp1 @ID VARCHAR(5)
AS
SELECT CustomerId, CustomerName, CustomerGender, CustomerAddress
FROM MsCustomer
WHERE CustomerId=@ID
GO

--2
CREATE OR ALTER PROCEDURE sp2
	@customername VARCHAR (255)
AS
IF len(@customername)%2=1
	PRINT 'Character Length of Customer Name is an Odd Number'
ELSE
	SELECT Head.CustomerId, CustomerName, CustomerGender, TransactionId, TransactionDate 
	FROM HeaderSalonServices as Head
	JOIN MsCustomer as Cu on Head.CustomerId=Cu.CustomerId
	WHERE CustomerName LIKE '%'+@customername+'%'
GO

--3
CREATE OR ALTER PROCEDURE sp3
	@StaffId VARCHAR (5),
	@StaffName VARCHAR (30),
	@StaffGender VARCHAR (6),
	@StaffPhone VARCHAR (20)
AS
	IF EXISTS (
		SELECT *
		FROM MsStaff
		WHERE StaffId=@StaffId
	)
	UPDATE MsStaff
	SET StaffName=@StaffName, StaffGender=@StaffGender, StaffPhone=@StaffPhone
	WHERE StaffId=@StaffId
	ELSE
	PRINT 'Staff does not exists'
GO

