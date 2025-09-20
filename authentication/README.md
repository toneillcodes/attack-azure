# Azure Authentication
- CLI
- Web endpoints

## Multiple Methods
There are multiple paths to authentication with Azure and the most optimal method depends on some factors.  
The first question is: what type of credentials do you have?

## Credentials
There are different types of credentials that can be used to authenticate.  
The most well-known being the traditional username and password combination.  
While on-premise AD DS allows authentication with the sAMAccountName, Azure requires a scoped identifier and leverages the User Principal Name (UPN).
