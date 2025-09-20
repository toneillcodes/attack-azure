# Azure Persistence
## Notes
- 'PowerApps' is a good name
- Use the Microsoft logo

[IR Playbook App Consent](https://learn.microsoft.com/en-us/security/operations/incident-response-playbook-app-consent)

### Preauthorization
Preauthorization allows a resource application owner to grant permissions without requiring users to see a consent prompt for the same set of permissions that have been preauthorized. This way, an application that has been preauthorized won't ask users to consent to permissions. Resource owners can preauthorize client apps in the Azure portal or by using PowerShell and APIs, like Microsoft Graph.

### [Application permission to Microsoft Graph](https://learn.microsoft.com/en-us/entra/identity-platform/quickstart-configure-app-access-web-apis#application-permission-to-microsoft-graph)
Configure application permissions for an application that needs to authenticate as itself without user interaction or consent. Application permissions are typically used by background services or daemon apps that access an API in a "headless" manner, and by web APIs that access another (downstream) API.

In the following steps, you grant permission to Microsoft Graph's Files.Read.All permission as an example.

Sign in to the Microsoft Entra admin center as at least a Cloud Application Administrator.
If you have access to multiple tenants, use the Settings icon  in the top menu to switch to the tenant containing the app registration from the Directories + subscriptions menu.
Browse to Identity > Applications > App registrations, and then select your client application.
Select API permissions > Add a permission > Microsoft Graph > Application permissions.
All permissions exposed by Microsoft Graph are shown under Select permissions.
Select the permission or permissions you want to grant your application. As an example, you might have a daemon app that scans files in your organization, alerting on a specific file type or name. Under Select permissions, expand Files, and then select the Files.Read.All permission.
Select Add permissions.
Some permissions, like Microsoft Graph's Files.Read.All permission, require admin consent. You grant admin consent by selecting the Grant admin consent button, discussed later in the Admin consent button section.
