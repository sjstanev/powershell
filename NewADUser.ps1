$NewUsers = Import-Csv D:\GitHub\powershell\NewUsers.csv

$pass = [System.Web.Security.Membership]::GeneratePassword(16,0)
$Securepass = $pass | ConvertTo-SecureString -AsPlainText -Force

Foreach ( $user in $NewUsers)
{
$props = @{
    "Givenname" = $user.Firstname
    "Surname" = $user.Surname
    "City" = $user.City
    "Country" = $user.Country
    "Department" = $user.Department
    "SamAccountName" =  $user.Firstname + '.' + $user.surname
    "Name" = $user.Firstname + ' ' + $user.surname
    "Displayname" = $user.Firstname + ' ' + $user.surname
    "Email" = $user.Firstname + $user.surname + '@mcsa.lan'
    }
    New-ADUser @props -Enable $true `
                      -ChangePasswordAtLogon $true `
                      -AccountPassword $Securepass `
                      -Path "OU=$($user.Department),DC=mcsa,DC=lan"

} #End of foreach