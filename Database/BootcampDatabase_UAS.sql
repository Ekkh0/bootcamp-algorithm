--1
SELECT 
	REPLACE(Head.CompanyID, 'C', 'Company ')[CompanyID],
	CompanyName,
	CompanyAddress+'No.'+RIGHT(Head.CompanyID, 1)[CompanyAddress],
	StartDate,
	EndDate
FROM HeaderTransaction as Head
JOIN Company as Co ON Head.CompanyID=Co.CompanyID
WHERE CompanyName LIKE '%Ironworks%'

--2
SELECT 
	'TR-'+RIGHT(Head.TransactionID, 1)[Transaction Code],
	Det.ProjectID,
	ProjectName,
	Revenue,
	ProjectBudget,
	Revenue-ProjectBudget[Profit]
FROM HeaderTransaction as Head
JOIN DetailTransaction as Det ON Head.TransactionID=Det.TransactionID
JOIN Project as Pro ON Det.ProjectID=Pro.ProjectID
WHERE Revenue BETWEEN 100000000 AND 200000000

--3
SELECT 
	Head.CompanyID,
	DeveloperID,
	CAST(AVG(Revenue)*0.1 as int)[Tax Revenue]
FROM HeaderTransaction as Head
JOIN DetailTransaction as Det ON Head.TransactionID=Det.TransactionID
JOIN Company as Co ON Head.CompanyID=Co.CompanyID
WHERE DAY(StartDate) BETWEEN 1 AND 4
GROUP BY Head.CompanyID, DeveloperID

--4
SELECT 
	SUBSTRING(DeveloperName, CHARINDEX(' ', DeveloperName)+1, CHARINDEX(' ', REVERSE(DeveloperName)))[Developer Lastname],
	DeveloperGender,
	ProjectName,
	ProjectBudget[Budget],
	SUM(ProjectBudget)[Total Budget],
	COUNT(Head.DeveloperID)[Developer Count For Specific Project]
FROM HeaderTransaction as Head
JOIN DetailTransaction as Det ON Head.TransactionID=Det.TransactionID
JOIN Project as Pro ON Det.ProjectID=Pro.ProjectID
JOIN Developer as Dev ON Dev.DeveloperID=Head.DeveloperID
WHERE DeveloperGender='Male' AND ProjectName='Swift Eagle'
GROUP BY ProjectName, DeveloperName, DeveloperGender, ProjectBudget
UNION
SELECT 
	SUBSTRING(DeveloperName, CHARINDEX(' ', DeveloperName)+1, CHARINDEX(' ', REVERSE(DeveloperName)))[Developer Lastname],
	DeveloperGender,
	ProjectName,
	ProjectBudget[Budget],
	SUM(ProjectBudget)[Total Budget],
	COUNT(Head.DeveloperID)[Developer Count For Specific Project]
FROM HeaderTransaction as Head
JOIN DetailTransaction as Det ON Head.TransactionID=Det.TransactionID
JOIN Project as Pro ON Det.ProjectID=Pro.ProjectID
JOIN Developer as Dev ON Dev.DeveloperID=Head.DeveloperID
WHERE DeveloperGender='Female' AND ProjectName='Eastern Windshield'
GROUP BY ProjectName, DeveloperName, DeveloperGender, ProjectBudget

--5
