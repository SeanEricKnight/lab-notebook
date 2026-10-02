function Get-FileAgeClass {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.IO.FileInfo]$File
    )

    process {
        $age = (Get-Date) - $File.LastWriteTime

        $class = if ($age.TotalDays -ge 1825) {
            'Archaeological'
        }
        elseif ($age.TotalDays -ge 730) {
            'Stale'
        }
        elseif ($age.TotalDays -ge 180) {
            'Aging'
        }
        else {
            'Current'
        }

        [pscustomobject]@{
            Name          = $File.Name
            FullName      = $File.FullName
            LastWriteTime = $File.LastWriteTime
            AgeDays       = [math]::Floor($age.TotalDays)
            Classification= $class
        }
    }
}
