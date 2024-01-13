$premium_users = @()
$other_users = @()
$subfolders = @()

# SearchBase
$OU = "UCUsers"

# Get all mailboxes for specific OU and select only user's names and databases
$alluser = Get-Mailbox -OrganizationalUnit $OU | select name,database

# Create direcotry with name OU_<ALL_USERS_IN_OU> and switch to it
$main_ou = ".\" + $OU + "_" +  $alluser.count
New-Item -ItemType directory -Path $main_ou -Force | Out-Null
Set-location -Path $main_ou

# Create array with users from different databases
$alluser | ForEach-Object {
 if($_.database -like "Premium")
 {
    # write-host "added user: " + $_.name + " to premium_users"
    $premium_users += $_.name
 } 
 else
 {
    # write-host "added user: " + $_.name + " to other_users"
    $other_users += $_.name
 }
}


# Create sub-directory for all databases with name DATABASE_<ALL_USERS_IN_DB>
$alluser | select database  | % {($_.database | select name)} | % {$subfolders += [string]$_.name } 
$subfolders = $subfolders | select -Unique | % {
 if($_ -like "Premium")
 {
    [string]$path = ".\" + $_ + "_" + $premium_users.count
    New-Item -ItemType directory -Path $path -Force | Out-Null
    $fileName = $OU  + "_" +  $_  + "_" + $premium_users.count + ".txt"
    echo EmailAddresses| out-file -Append  $path\$fileName 
    $premium_users | out-file -Append $path\$fileName 
 } 
 else
 {
    [string]$path = ".\" + $_ + "_" + $other_users.count
    New-Item -ItemType directory -Path $path -Force | Out-Null
    $fileName = $OU  + "_" +  $_  + "_" + $other_users.count + ".txt"
    echo EmailAddresses| out-file -Append  $path\$fileName 
    $other_users | out-file -Append  $path\$fileName 
 }
}

cd ..
