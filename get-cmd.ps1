Get-Service
Get-Service | select Name
"This is test script"
Get-Process
Get-Process | Get-Member
Get-Process | GM
Get-ChildItem
dir
ls | GM
Get-Command *PSDrive*
New-PSDrive -Name ml -PSProvider FileSystem -Root '\\10.90.0.101\C$' -Credential (Get-Credential)
Remove-PSDrive ml
Get-PSProvider

$x = [ordered]@{
"key1" = 7
"key2" = "Stanimir Stanev"
}

$x | GM
$x.Add('key3',8)
$x.GetType()
$y = 1, "word1"
$y.GetType()


Get-Process | Select-Object ProcessName, CPU | Sort-Object -Property CPU  -Descending -Unique
Get-Process | Select-Object ProcessName | GM
Get-Process | Select-Object -ExpandProperty ProcessName | GM

Get-Process | Where-Object -FilterScript {$_.CPU -gt 40.00 } | Sort-Object -Property CPU -Descending
Get-Process | Where-Object  {$_.CPU -gt 40.00 } | Sort-Object -Property CPU -Descending
Get-Process | ?  {$_.CPU -gt 40.00 } | Sort-Object -Property CPU -Descending
Get-Process | Where-Object -FilterScript {$PSItem.CPU -gt 40.00 } | Sort-Object -Property CPU -Descending

Get-Service | ? {$_.Name -like 'bits'} 
Get-Service | ? {$_.Name -like 'bits'} | Select-Object Status

Get-Service | ? {$_.Name -like '*WMI*'} 

Get-Service | Select-Object -Property '*can*',name | ? {$_.CanShutdown -eq 'true'} and {$_.CanStop -eq 'true'}

Get-EventLog -LogName Application -Newest 5 | Out-File 'C:\Users\localadmin\Desktop\newest5.txt'

Get-Content C:\Users\localadmin\desktop\newest5.txt

Test-Connection cisco.com -Count 1
Test-Connection cisco.com -Count 1 | select Destination,IPv4Address,ReplySize,ro$uterecord

 <# Test connection throuh a loop #> 
$site = 'cisco.com', 'dir.bg'
$site | ForEach-Object {$_; test-connection $_ -Count 1 -Quiet}

 <# TEST-CONNECTION VIA LOOP USING CUSTOM HEADER #> 
 $site | ForEach-Object {
    $_ | select @{ Name = 'MachineName'; expression={$_}},
    @{
        Name = 'IsOnline';
        expression = {test-connection $_ -Count 1 -Quiet}
    }
 }

Get-Command -Noun *Object*

Get-EventLog -LogName Application -Newest 10 | Group-Object -Property Index

Get-Process svchost 
Get-Process svchost | Measure-Object -Property ws -Maximum -Minimum -Average
Get-Process svchost | Measure-Object -Property cpu -Maximum -Minimum -Average

$a = Get-Process
start cmd.exe
$b = Get-Process
Compare-Object -ReferenceObject $a -DifferenceObject $b

Compare-Object -ReferenceObject $a -DifferenceObject $b -IncludeEqual


