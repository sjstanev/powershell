Get-host
Get-Alias cls
Get-Command -Verb get -Noun *VM*
get-help -name Get-VMSwitch -ShowWindow
Get-Command -Module *Hyper*
Get-Process | Get-Member
Get-Help about* 
Get-Help about_PSSessions
cd ..
Set-Location powershell
Get-PSDrive




get-aduser -Filter {mail -like "*"} | select Name, userprincipalname | ? {$_.name -notlike "*System*" -and $_.name -notlike "Healt*"} | ForEach-Object {write-host $_.userprincipalname}