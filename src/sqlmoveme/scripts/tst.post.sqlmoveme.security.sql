-- SECURITY SECTION
USE [sqlmoveme]
IF NOT Exists(SELECT * FROM sys.database_principals WHERE name = 'sqlmoveme_tst_admins')  
CREATE USER  [sqlmoveme_tst_admins] FROM EXTERNAL PROVIDER
EXEC sp_addrolemember 'db_owner','sqlmoveme_tst_admins';
GO