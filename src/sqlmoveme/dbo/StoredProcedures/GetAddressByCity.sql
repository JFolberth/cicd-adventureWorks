CREATE PROCEDURE [dbo].[GetAddressByCity]
  @City string = '*'
AS
  SELECT [AddressID], [AddressLine1], [City], [StateProvince], [CountryRegion], [PostalCode]
  FROM [SalesLT].[Address]
  WHERE [City] = @City
RETURN 0
