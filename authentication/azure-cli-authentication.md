# Azure CLI Authentication
## Command Line Solutions
- [Azure PowerShell Module](https://learn.microsoft.com/en-us/powershell/azure/new-azureps-module-az?view=azps-14.4.0) from Microsoft
- [Azure CLI tools](https://learn.microsoft.com/en-us/cli/azure/?view=azure-cli-latest) from Microsoft
- [SDKs](https://learn.microsoft.com/en-us/azure/developer/python/sdk/azure-sdk-overview) from Microsoft

## Azure PowerShell Login Examples
Check for existing sessions
```
Get-AzContext
```
### Using a UPN and Password
```
$username = "someuser@domain.onmicrosoft.com"
$passowrd = "WAh00000Vjo"
$tenantId = "2b7a41c2-..."
$credentials = (New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $username, (ConvertTo-SecureString -String $password -AsPlainText -Force))
Connect-AzAccount -Tenant $tenantId -Credential $credentials
```

### Using a Service Principal and Secret 
```
$servicePrincipalId = "6960bb69-..."
$servicePrincipalSecret = "y6c8Q~AxXg..."
$tenantId = "2b7a41c2-..."
Connect-AzAccount -ServicePrincipal -Credential (New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $servicePrincipalId, (ConvertTo-SecureString -String $servicePrincipalSecret -AsPlainText -Force)) -Tenant $tenantId
```
