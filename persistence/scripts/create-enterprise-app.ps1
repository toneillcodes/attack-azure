# Create application with required permissions to access Microsoft Graph
$newApp = New-AzureADApplication -DisplayName "MyGraphApp" -ReplyUrls "https://hacker.onmicrosoft.com/testing/oauth/fake/omg" 

# Add delegated permissions for user profile access
$permissions = @("User.Read", "profile")
$newApp = Add-AzureADApplicationDelegatedPermission -ApplicationObjectId $newApp.ObjectId -ResourceAppId "00000002-0000-0ff1-ce00-000000000000" -DelegatedPermissions $permissions

# Get the application ID and client secret for further configuration
Write-Output "Application ID: $($newApp.AppId)"
Write-Output "Client Secret: $($newApp.PasswordCredentials[0].SecretValue)"
