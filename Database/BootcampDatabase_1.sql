--1
CREATE TABLE MsCustomer
(
	CustomerId CHAR (5) NOT NULL PRIMARY KEY,
	CustomerName VARCHAR (50),
	CustomerGender VARCHAR (10),
	CustomerPhone VARCHAR (13),
	CustomerAddress VARCHAR (100),

	CONSTRAINT Check_CU_NUM
		CHECK(CustomerId='CU[0-9][0-9][0-9]'),
	CONSTRAINT Check_Gender
		CHECK(CustomerGender='Male'),
		CHECK(CustomerGender='Female')
)

CREATE TABLE MsStaff
(
	StaffId CHAR (5) NOT NULL PRIMARY KEY,
	StaffName VARCHAR (50),
	StaffGender VARCHAR (10),
	StaffPhone VARCHAR (13),
	StaffAddress VARCHAR (100),
	StaffSalary NUMERIC (11,2),
	StaffPosition VARCHAR (20),

	Constraint Check_Staff_Gender
		CHECK(StaffGender='Male'),
		CHECK(StaffGender='Female'),
	Constraint Check_StaffId
		CHECK(StaffId='SF[0-9][0-9][0-9]')
)

CREATE TABLE MsTreatmentType
(
	TreatmentTypeId CHAR (5) NOT NULL PRIMARY KEY,
	TreatmentTypeName VARCHAR (50),

	Constraint Check_TypeId
		CHECK(TreatmentTypeId='TT[0-9][0-9][0-9]')
)

CREATE TABLE MsTreatment
(
	TreatmentId CHAR (5) NOT NULL PRIMARY KEY,
	TreatmentTypeId CHAR (5) NOT NULL,
	TreatmentName VARCHAR (50),
	Price NUMERIC (11,2),

	Constraint Check_TreatmentId
		CHECK(TreatmentId='TM[0-9][0-9][0-9]'),
	Constraint Treatment_Fk
		FOREIGN KEY(TreatmentTypeId) REFERENCES MsTreatmentType(TreatmentTypeId)
		ON UPDATE CASCADE
)

CREATE TABLE HeaderSalonServices
(
	TransactionId CHAR (5) PRIMARY KEY NOT NULL,
	CustomerId CHAR (5),
	StaffId CHAR(5),
	TransactionDate DATE,
	PaymentType VARCHAR (20),

	Constraint CustId_FK
		FOREIGN KEY(CustomerId) REFERENCES MsCustomer(CustomerId)
		ON UPDATE CASCADE,
	Constraint StaffId_FK
		FOREIGN KEY(StaffId) REFERENCES MsStaff(StaffId)
		ON UPDATE CASCADE,
	Constraint check_TransId
		CHECK(TransactionId='TR[0-9][0-9][0-9]')
)

CREATE TABLE DetailSalonServices
(
	TransactionId CHAR (5) NOT NULL,
	TreatmentId CHAR (5) NOT NULL,

	Constraint TransId_FK
		FOREIGN KEY(TransactionId) REFERENCES HeaderSalonServices(TransactionId)
		ON UPDATE CASCADE,
	Constraint TreatId_FK
		FOREIGN KEY(TreatmentId) REFERENCES MsTreatment(TreatmentId)
		ON UPDATE CASCADE,
	Constraint PK
		PRIMARY KEY(TransactionId, TreatmentId)
)

--2
DROP TABLE DetailSalonServices

--3
CREATE TABLE DetailSalonServices
(
	TransactionId CHAR (5) NOT NULL,
	TreatmentId CHAR (5) NOT NULL,

	Constraint TransId_FK
		FOREIGN KEY(TransactionId) REFERENCES HeaderSalonServices(TransactionId)
		ON UPDATE CASCADE,
	Constraint TreatId_FK
		FOREIGN KEY(TreatmentId) REFERENCES MsTreatment(TreatmentId)
		ON UPDATE CASCADE,
)

ALTER TABLE DetailSalonServices
ADD Constraint PK
		PRIMARY KEY(TransactionId, TreatmentId)

--4
ALTER TABLE MsStaff
WITH NOCHECK
ADD Constraint Validate
		CHECK(LEN(StaffName) BETWEEN 5 AND 20)

ALTER TABLE MsStaff
DROP Validate

--5
ALTER TABLE MsTreatment
ADD Description VARCHAR (100)

ALTER TABLE MsTreatment
DROP COLUMN Description