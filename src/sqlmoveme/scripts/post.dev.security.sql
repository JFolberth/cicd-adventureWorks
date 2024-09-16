Use master
CREATE LOGIN [sqlmoveme_dev_admins@MngEnvMCAP100965.onmicrosoft.com] FROM EXTERNAL PROVIDER
GO

Use master
CREATE USER  [sqlmoveme_dev_admins@MngEnvMCAP100965.onmicrosoft.com] FROM LOGIN  [sqlmoveme_dev_admins@MngEnvMCAP100965.onmicrosoft.com]

ALTER ROLE [dbmanager] ADD MEMBER [sqlmoveme_dev_admins@MngEnvMCAP100965.onmicrosoft.com] 
ALTER ROLE [loginmanager] ADD MEMBER [sqlmoveme_dev_admins@MngEnvMCAP100965.onmicrosoft.com] 