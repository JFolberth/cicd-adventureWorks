ALTER PROCEDURE [TestPerson].[TestGetAddressByCitySuccess]
AS
BEGIN
  EXEC tSQLt.FakeTable @TableName = 'SalesLT.Address';
  DECLARE @City NVARCHAR(30) = 'Toronto';

  INSERT INTO SalesLT.Address ( AddressLine1, City, StateProvince, CountryRegion, PostalCode)
  VALUES ( '1234 Main St', @City, 'Ontario', 'Canada', '12345');

  SELECT  [AddressLine1], [City], [StateProvince], [CountryRegion], [PostalCode]
  INTO #Expected FROM SalesLT.Address AS [AD] WHERE [AD].[CITY] = @City

  SELECT  [AddressLine1], [City], [StateProvince],[CountryRegion], [PostalCode]
  INTO #Actual FROM SalesLT.Address AS [AD] 

  INSERT INTO #Actual EXEC [SalesLT].[GetAddressByCity] @City = @City

  EXEC tSQLt.AssertEqualsTable @Expected = '#Expected', @Actual = '#Actual';

  IF OBJECT_ID('tempdb..#Expected') IS NOT NULL DROP TABLE #Expected;
    IF OBJECT_ID('tempdb..#Actual') IS NOT NULL DROP TABLE #Actual;
END;