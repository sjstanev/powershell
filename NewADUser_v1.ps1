<#
.Synopsis
    Create bulk AD user accounts from HR CSV
.Desciption
    Long description
.Example
    New-Bulkusers -UserCSV D:\GitHub\powershell\NewUsers.csv
#>

function New-BulkUsers
{
    [CmdletBindinf()]

    Param
    (
        [Parameter(Mandatory=$true,
                    ValueFromPipeline=$true,
                    Position=0)]
        [String]
        $UserCSV
    )
BEGIN{

$NewUsers = Import-csv $UserCSV

#check CSV properties not blank at all
    if ($NewUsers | Where-Object {$_.psobject.properties.value -contains ""}){

    Write-Error "Required information in the CSV is missing" -ErrorAction Stop

    }

#generate password for the users
    Write-Verbose "Creating Randomly generated Password of 16 lenght for $($user.firstname)"
    [String]$pass = [System.Web.Security.Membership]::GeneratePassword(16,0)
    $Securepass = $pass | ConvertTo-SecureString -AsPlainText -Force

#Report Styling
$Style = "<style>"
$Style += "BODY{background-color:peachpuff;}"
$Style += "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$Style += "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;}"
$Style += "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black}"
$Style = "</style>"

}

PROCESS {

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

Try {

#create users
    New-ADUser @props -Enable $true `
                      -ChangePasswordAtLogon $true `
                      -AccountPassword $Securepass `
                      -Path "OU=$($user.Department),DC=mcsa,DC=lan" -verbose

    } catch [Microsoft.ActiveDirectory.Management.ADIdenityAlreadyExistsException] {

    Write-Error #$_, This will be skipped"
    
    } catch [exceptio] {

    Write-Error $_

    }

} #End of foreach

} #End of process

END{
Get-ADuser -filter * -property Created | 
            Where-Object {$_.created -gt (Get-Date).AddMinutes(-5)} | 
            Select-Object Name,
                          DistinguishedName,
                          Enable,
                          Created,
                          @{Name='Password';Expresion={$Pass}} |
                          ConvertTo-Html -Head $Style -Body "<H2> AD User accounts created for $(get-Date)</H2>"|  
                          Out-File "$((Get-Location).Path)\NewUsersReport_$(Get-Date -Format dd-MM-yy_HH-mm).html"

Write-verbose "HTML report has been created at $((Get-Location).Path)\NewUsersReport_$(Get-Date -Format dd-MM-yy_HH-mm).html"
#Invoke-Item  D:\GitHub\NewUsersReport.hml
 } #End of END Block
} #End of the function