$servers = @('SERVER1','SERVER2','SERVER3','SERVER4','SERVER5')
for ($i = 0; $i –lt $servers.Length; $i++) {
    $servers[$i] = "new $($servers[$i])"
}
$servers

for ($i = 1; $i –lt $servers.Length; $i++) {
    Write-Host $servers[$i] "comes after" $servers[$i-1]
}

$x = 5
while ($x -gt 0)
{
   $x
   $x -= 1 
}

do {
    $choice = Read-Host -Prompt 'What is the best programming language?'
} until ($choice -eq 'PowerShell')
Write-Host -Object 'Correct!'