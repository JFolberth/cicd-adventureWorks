@description('The name of the SQL logical server.')
param serverBaseName string
@description('Three letter environment abreviation to denote environment that will appear in all resource names') 
param environmentName string = 'dev'
@description('The name of the SQL Database.')
param sqlDBName string = 'sqlmoveme'

@description('Location for all resources.')
param location string = resourceGroup().location
@description('What language was used to deploy this resource')
param language string

var regionReference = {
  centralus: 'cus'
  eastus: 'eus'
  westus: 'wus'
  westus2: 'wus2'
}

var serverName = 'sql-${serverBaseName}-${environmentName}-${regionReference[location]}'
 
resource sqlServer 'Microsoft.Sql/servers@2023-08-01-preview' existing = {
  name: serverName
}

resource sqlDB 'Microsoft.Sql/servers/databases@2023-08-01-preview' = {
  parent: sqlServer
  name: sqlDBName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
  tags: {
    Language: language
  }
  
}
