USE [sqlmoveme]
BEGIN
    DELETE FROM [SalesLT].[Address];
    INSERT INTO [SalesLT].[Address]VALUES('Apartment 5A','129 W. 81st St.','New York','NY','USA','10001',newid(),SYSDATETIME())
    INSERT INTO [SalesLT].[Address]VALUES('2311 North Los Robles Avenue','','Pasadena','CA','USA','91001',newid(),SYSDATETIME())
    INSERT INTO [SalesLT].[Address]VALUES('742 Evergreen Terrace','','Springfield','IL','USA','65619',newid(),SYSDATETIME())
END
GO
