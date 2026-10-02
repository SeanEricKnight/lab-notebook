. "$PSScriptRoot/Get-FileAgeClass.ps1"

Get-ChildItem -File |
    Get-FileAgeClass |
    Sort-Object AgeDays -Descending |
    Format-Table -AutoSize
