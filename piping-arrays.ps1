# add W32Time and Wuauserv to file service.txt
"W32Time`nWuauserv" | Out-File -FilePath .\services.txt -Append

# Get-services status
Get-Content -Path .\services.txt | Get-Service

<# get service on specific computer using -property name and computername #>
$serviceObject = [PScustomObject]@{Name = 'wuauserv'; ComputerName = 'DELLXPS'}
$serviceObject | Get-Service