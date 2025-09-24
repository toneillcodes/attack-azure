# Azure CLI Authentication
## Command Line Solutions
- [Azure CLI tools](https://learn.microsoft.com/en-us/cli/azure/?view=azure-cli-latest) from Microsoft
- [Azure PowerShell Module](https://learn.microsoft.com/en-us/powershell/azure/new-azureps-module-az?view=azps-14.4.0) from Microsoft
- [SDKs](https://learn.microsoft.com/en-us/azure/developer/python/sdk/azure-sdk-overview) from Microsoft

## Azure PowerShell Login Examples
Check for existing sessions
```
Get-AzContext
```
### Using a UPN and Password
```
$credentials = (New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList "someuser@domain.onmicrosoft.com", (ConvertTo-SecureString -String "WAh00000Vjo" -AsPlainText -Force))
Connect-AzAccount -Tenant 2b0000c2-0000-0000-943b-0000ffc1a00b -Credential $credentials
```

### Using a Service Principal and Secret 
```
$servicePrincipalId = "6960bb69-..."
$servicePrincipalSecret = "y6c8Q~AxXg..."
$tenantId = "2b7a41c2-..."
Connect-AzAccount -ServicePrincipal -Credential (New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $servicePrincipalId, (ConvertTo-SecureString -String $servicePrincipalSecret -AsPlainText -Force)) -Tenant $tenantId
```
