Get-PSProvider
cd WSMAN:
ls
cd localhost
ls
cd .\client
ls
cd .\Auth
ls

Set-Item wsman:\localhost\client\trustedhosts -value "10.61.0.10" -Concatenate
Get-Item WSMan:\localhost\Client\TrustedHosts