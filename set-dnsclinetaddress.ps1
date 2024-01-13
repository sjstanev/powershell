Get-DnsClientServerAddress -InterfaceIndex 8 
Set-DnsClientServerAddress -InterfaceIndex 8 -ServerAddresses ("10.61.0.10", "10.81.0.10")
Get-DnsClientServerAddress -InterfaceIndex 8
