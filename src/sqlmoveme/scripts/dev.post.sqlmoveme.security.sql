Use [sqlmoveme]
CREATE USER  [sqlmoveme_dev_admins] FROM EXTERNAL PROVIDER
EXEC sp_addrolemember 'db_owner','sqlmoveme_dev_admins';
GO