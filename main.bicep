param location string = resourceGroup().location
param serverName string = 'my-test-sql-server'

var adminUser = 'dbadmin'
var adminPassword = 'SuperSecretPassword123!@#'

resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: serverName
  location: location
  properties: {
    administratorLogin: adminUser
    administratorLoginPassword: adminPassword
  }
}
