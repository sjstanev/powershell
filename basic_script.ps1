Get-Alias cls
Rename-Computer -NewName "mail"
shutdowm /r /t 0
Get-NetAdapter -Physical | ? {$_.Status -eq "Up"}


get-aduser -filter * -Properties * | select name,  @{N='LastLogon'; E={[DateTime]::FromFileTime($_.LastLogon)}} | ForEach-Object { if ($_.lastlogon.year -eq "2023" -and $_.name -notlike "HealthMailbox*" ) {$_.name + " <--> " + $_.las
tlogon} }
