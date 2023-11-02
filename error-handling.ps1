$folderPath = '.\bogusFolder'
try {
    $files = Get-ChildItem -Path $folderPath –ErrorAction Stop
    $files.foreach({
        $fileText = Get-Content $files
        $fileText[0]
    })
} catch {
    $_.Exception.Message
}


$filePath = '.\bogusFile.txt'
try {
    Get-Content $filePath
} catch {
    Write-Host "We found an error"
}