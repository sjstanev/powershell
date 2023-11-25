If you're not running Exchange Powershell for Exchange cmdlets, you must first import the Exchange module.
```
Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn
```


Move Databse to different location
```
Move-DatabasePath -Identity 'VIP Users' –EdbFilePath 'E:\Exchange\MailboxDatabase\VIP Users\VIP Users.edb'
Move-DatabasePath -Identity 'VIP Users' -LogFolderPath 'E:\Exchange\MailboxDatabase\VIP Users\Logs'
```
-----------------------------------------------------------------------------------------------------------------

https://community.spiceworks.com/how_to/186629-how-to-repair-exchange-database-dirty-shutdown-top-two-ways

1. In the first step, we will run a consistency check on our Exchange database. For that, the required command is:
```
eseutil /MH E:\Exchange\MailboxDatabase\Mailbox Database 0510216722\Mailbox Database 0510216722.edb"
```

The storage location of your EDB file can be different depending on the Exchange version that you are running.

2. After successful execution of the command, if the State of your database is in a Dirty Shutdown state, then we will perform soft recovery on the database. 
In Exchange Soft Recovery , the command will replay the transaction log files and ensure that all the operations performed in the database are completed.
```
eseutil /R E00 /l "C:\Program Files\Microsoft\Exchange Server\V15\Mailbox\Mailbox Database 0510216722" /d "E:\Exchange\MailboxDatabase\Mailbox Database 0510216722\Mailbox Database 0510216722.edb"
```

If the Exchange database has minor corruption levels, then the aforementioned command will repair Exchange Database Dirty Shutdown State. 
To ensure that the database is back into a Clean Shutdown state, you have to perform an Exchange database health check again.

3. If the database is still in a Dirty Shutdown state, then you have to perform a hard recovery on your database. The command for hard recovery is:
```
eseutil /p "E:\Exchange\MailboxDatabase\Mailbox Database 0510216722\Mailbox Database 0510216722.edb"
```
-------------------------------------------------------------------------------------------------------


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
winrs -r:192.168.10.50 -u:admin -p:`<password>` dir
```
-----------------------------------------------------------------------------------
Troubleshooting:
```
Get-NetConnectionProfile
Set-NetConnectionProfile -Name "Tree 5G 2" -NetworkCategory Private
```
