Get-host
Get-Alias cls
Rename-Computer -NewName "mail"
shutdowm /r /t 0
Get-NetAdapter -Physical | ? {$_.Status -eq "Up"}


get-aduser -filter * -Properties * | select name,  @{N='LastLogon'; E={[DateTime]::FromFileTime($_.LastLogon)}} | ForEach-Object { if ($_.lastlogon.year -eq "2023" -and $_.name -notlike "HealthMailbox*" ) {$_.name + " <--> " + $_.las
tlogon} }

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