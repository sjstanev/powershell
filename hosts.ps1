Get-Content C:\Windows\System32\drivers\etc\hosts
#"#`t10.1.1.1`tmcsa.lab`t# mail server" | Out-File -filepath C:\Windows\System32\drivers\etc\hosts -Append

$x = 1..3
$new_string = $null; $x.foreach({$ip = "1.1.1." + $_; $new_string += "#`t$ip`tmcsa.lab`t# mail server`n" });$new_string
$new_string | Out-File -filepath D:\GitHub\powershell\hosts.txt -Append
Get-Content D:\GitHub\powershell\hosts.txt 
$fileHosts = "D:\GitHub\powershell\hosts.txt"

Get-Content $fileHosts | % { if ($_.contains("1.1.1.2")){$_}}

Get-Content $fileHosts | ForEach-Object { $_;
    if("*1.1.1.1*" -in "$_"){
        write-host $_; Write-Host "YES"
    }
    else{$newfile += "$_`n";Write-Host "NO"}
}
$newfile