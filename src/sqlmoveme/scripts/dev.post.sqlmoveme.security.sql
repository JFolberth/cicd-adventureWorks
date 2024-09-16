-- SECURITY SECTION
USE [sqlmoveme]
IF NOT Exists(SELECT * FROM sys.database_principals WHERE name = 'sqlmoveme_dev_admins')  
    CREATE USER  [sqlmoveme_dev_admins] FROM EXTERNAL PROVIDER
    EXEC sp_addrolemember 'db_owner','sqlmoveme_dev_admins';
GO

-- DROP AND RELOAD DATA SECTION
USE [sqlmoveme]
DROP TABLE IF EXISTS [SalesLT].[Address];
INSERT INTO [SalesLT].[Address]VALUES('Apartment 5A','129 W. 81st St.','New York','NY','USA','10001',newid(),SYSDATETIME())
INSERT INTO [SalesLT].[Address]VALUES('2311 North Los Robles Avenue','','Pasadena','CA','USA','91001',newid(),SYSDATETIME())
INSERT INTO [SalesLT].[Address]VALUES('742 Evergreen Terrace','','Springfield','IL','USA','65619',newid(),SYSDATETIME())
GO