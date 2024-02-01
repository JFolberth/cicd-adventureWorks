ALTER PROCEDURE [TestPerson].[TestGetAddressByCitySuccess]
AS
BEGIN
  EXEC tSQLt.FakeTable @TableName = 'SalesLT.Address';
  DECLARE @City NVARCHAR(30) = 'Miami';

  INSERT INTO SalesLT.Address (AddressID, AddressLine1, City, StateProvince, PostalCode)
  VALUES (1, '1234 Main St', @City, 1, '12345');

  SELECT AddressID, [AddressLine1], [City], [StateProvince], [PostalCode]
  INTO #Expected FROM [SalesLT.Address] AS [AD] WHERE [AD].[CITY] = @City

  SELECT [AddressID], [AddressLine1], [City], [StatePStateProvincerovinceID], [PostalCode]
  INTO #Actual FROM [SalesLT.Address] AS [AD] WHERE 1=0

  INSERT INTO #Actual EXEC [SalesLT].[GetAddressByCity] @City = @City

  EXEC tSQLt.AssertEqualsTable @Expected = N'#Expected', @Actual = N'Actual', @Message = N'Data not returned';

  IF OBJECT_ID('tempdb..#Expected') IS NOT NULL DROP TABLE #Expected;
    IF OBJECT_ID('tempdb..#Actual') IS NOT NULL DROP TABLE #Actual;
END;