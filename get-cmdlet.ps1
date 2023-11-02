$input = Read-host "what is your name"
if ($input -eq 'Stan')
{
    Write-Host "Welcome Stan" -ForegroundColor Green
}
else
{
    Write-Host "Sorry only for Stan" -ForegroundColor Red
}


# Create custem object with following property
$myFirstCustomObject = [PSCustomObject]@{OSBuild = '11'; OSVersion = '4.3'}
$myFirstCustomObject | gm

