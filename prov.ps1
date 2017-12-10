Import-Module SharePointPnPPowerShellOnline

# Get site url
set-variable -scope Global -name siteUrl -value $env:siteUrl

# Get credentials
$password = $env:deploypassword | ConvertTo-SecureString -asPlainText -Force
$username = $env:deployusername
$cred = New-Object System.Management.Automation.PSCredential($username,$password)

# cd to root script folder
cd $PSScriptRoot


##
# Root site collection
##
Write-Host "> Connect to site collection root" $siteUrl
Connect-PnPOnline –Url $siteUrl -Credentials $cred

# Provisioning
Write-Host "> Provisioning"
Apply-PnPProvisioningTemplate -Path .\provtemplate.xml