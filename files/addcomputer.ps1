$domain = "MyDomain" 
$password = "mypassword" | ConvertTo-SecureString -asPlainText -Force 
$username = "$domain\adminuser"  
$credential = New-Object System.Management.Automation.PSCredential($username,$password) 
if ((gwmi win32_computersystem).partofdomain -eq $true) {exit 0}
Add-Computer -DomainName $domain -Credential $credential
Restart-Computer
