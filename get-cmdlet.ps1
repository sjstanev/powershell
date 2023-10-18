$input = Read-host "what is your name"
if ($input -eq 'Stan')
{
    Write-Host "Welcome Stan" -ForegroundColor Green
}
else
{
    Write-Host "Sorry only for Stan" -ForegroundColor Red
}