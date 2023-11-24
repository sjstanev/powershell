If you're not running Exchange Powershell for Exchange cmdlets, you must first import the Exchange module.
```
Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn
```


Move Databse to different location
```
Move-DatabasePath -Identity 'VIP Users' –EdbFilePath 'E:\Exchange\MailboxDatabase\VIP Users\VIP Users.edb'
Move-DatabasePath -Identity 'VIP Users' -LogFolderPath 'E:\Exchange\MailboxDatabase\VIP Users\Logs'
```


REMOTE HOSTS:
On the remote (managed) server
Create the required firewall rules

Enable-PSRemoting

Enable the use of CredSSP for authentication
Enable-WSManCredSSP -Role "Server"



-----------------------------------------------------------------------------------

LOCAL MACHINE:
```
Set-Item wsman:\localhost\client\trustedhosts -value "192.168.10.50" -Concatenate
```

to see trusted host
```
Get-Item WSMan:\localhost\Client\TrustedHosts
```

then check double firewall incoimg rules for WIMRM Public
CHECK CONN:
```
Enter-PSSession 192.168.10.50 -Credential admin
or
winrs -r:192.168.10.50 -u:admin -p:T3tra@aec dir
```
-----------------------------------------------------------------------------------
Troubleshooting:
```
Get-NetConnectionProfile
Set-NetConnectionProfile -Name "Tree 5G 2" -NetworkCategory Private
```
