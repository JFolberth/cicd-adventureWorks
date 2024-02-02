CREATE PROCEDURE [SalesLT].[GetAddressByCity]
  @City varchar
AS
  SELECT [AddressLine1], [City], [StateProvince], [CountryRegion], [PostalCode]
  FROM [SalesLT].[Address]
  WHERE [City] = @City
RETURN
