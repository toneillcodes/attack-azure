# Azure Authentication
- [CLI](https://github.com/toneillcodes/attack-azure/blob/main/authentication/azure-cli-authentication.md)
- Web endpoints

## Multiple Methods
There are multiple paths to authentication with Azure and the most optimal method depends on some factors.  
The first question is: what type of credentials do you have?

## Credentials
There are different types of credentials that can be used to authenticate.  
The most well-known being the traditional username and password combination.  
While on-premise AD DS allows authentication with the sAMAccountName, Azure requires a scoped identifier and leverages the User Principal Name (UPN).

## Handling Credentials
### Transition from Strings to Secure Strings
To improve security and reduce the risk of credential leaks, the default output type of the Get-AzAccessToken cmdlet changed from a plain text String to a SecureString, starting with Az.Accounts version 5.0.0 and Az version 14.0.0.  
Source: [Transition from Strings to SecureStrings](https://learn.microsoft.com/en-us/powershell/azure/protect-secrets?view=azps-14.4.0)
### How can I convert a SecureString to plain text in PowerShell?
You can use the following code snippet to convert a SecureString ($secureString) into plain text ($plainText):
```
$ssPtr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureString)
try {
    $plaintext = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($ssPtr)
    # Perform operations with the contents of $plaintext in this section.
} finally {
    # The following line ensures that sensitive data is not left in memory.
    $plainText = [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ssPtr)
}
```
https://learn.microsoft.com/en-us/powershell/azure/faq?view=azps-14.4.0#how-can-i-convert-a-securestring-to-plain-text-in-powershell-
