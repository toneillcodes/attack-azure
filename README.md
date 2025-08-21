# Attack Azure
Offensive tools, tactics and research on the Azure/Entra platform.
- [azrecon.sh](https://github.com/toneillcodes/attack-az/blob/main/azrecon.sh): External pentesting/red team tool to enumerate domain properties and user accounts
- Azure Persistence Methods: research into post-compromise methods
- More

## azrecon.sh
```
azrecon.sh -m MODE -d DOMAIN -u USER
```
Domain mode collects the domain information only
```
$ ./azrecon.sh -m domain -d contoso.com
Collecting tenant info...
TenantID=6babcaad-604b-40ac-a9d7-9fd97c0b779f
Collecting realm info...
RealmInfo:
DomainName=contoso.com
NameSpaceType=Managed
FedBrandName=Contoso, Ltd
Done.
$
```
User mode collects the domain information and if the NameSpaceType is 'Managed' it will check the username provided<br>
Example output where user is found:
```
$ ./azrecon.sh -m user -d contoso.com -u admin
Collecting tenant info...
TenantID=6babcaad-604b-40ac-a9d7-9fd97c0b779f
Collecting realm info...
RealmInfo:
DomainName=contoso.com
NameSpaceType=Managed
FedBrandName=Contoso, Ltd
Username provided, checking admin@contoso.com
IfUserExists=0
User admin exists in contoso.com (6babcaad-604b-40ac-a9d7-9fd97c0b779f)
Done.
$
```
Example output when the user is not found:
```
$ ./azrecon.sh -m user -d contoso.com -u bill
Collecting tenant info...
TenantID=6babcaad-604b-40ac-a9d7-9fd97c0b779f
Collecting realm info...
RealmInfo:
DomainName=contoso.com
NameSpaceType=Managed
FedBrandName=Contoso, Ltd
Username provided, checking bill@contoso.com
IfUserExists=1
User bill does NOT exist in contoso.com (6babcaad-604b-40ac-a9d7-9fd97c0b779f)
Done.
$
```
NOTE: If the NameSpaceType is 'Federated', the script cannot reliably check the user account and it will skip the check
```
$ ./azrecon.sh -m user -d microsoft.com -u admin
Collecting tenant info...
TenantID=72f988bf-86f1-41af-91ab-2d7cd011db47
Collecting realm info...
RealmInfo:
DomainName=microsoft.com
NameSpaceType=Federated
FedBrandName=Microsoft
AuthURL=https://msft.sts.microsoft.com/adfs/ls/?username=microsoft.com&amp;wa=wsignin1.0&amp;wtrealm=urn%3afederation%3aMicrosoftOnline&amp;wctx=
STSAuthURL=https://msft.sts.microsoft.com/adfs/services/trust/2005/usernamemixed
Domain is not 'Managed', skipping user enumeration checks
Done.
$
```
