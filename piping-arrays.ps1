# add W32Time and Wuauserv to file service.txt
"W32Time`nWuauserv" | Out-File -FilePath .\services.txt -Append

# Get-services status
Get-Content -Path .\services.txt | Get-Service