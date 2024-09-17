USE [sqlmoveme]

IF NOT Exists(SELECT * FROM sys.database_principals WHERE name = 'sqlmoveme_dev_admins') 
    BEGIN  
        CREATE USER  [sqlmoveme_dev_admins] FROM EXTERNAL PROVIDER
    END
EXEC sp_addrolemember 'db_owner','sqlmoveme_dev_admins';

GO