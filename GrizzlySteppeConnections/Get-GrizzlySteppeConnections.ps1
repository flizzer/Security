$pathToCSVFile = "GrizzlySteppeConnections.csv"
$remoteHosts = get-content -path $pathToCSVFile | select-object -skip 1
foreach ($remoteHost in $remoteHosts)
{
    $remoteHostClean = $($remoteHost -replace "\[","" -replace "\]","" -replace ",","").Split("/")[0]
    write-host "Connections for $remoteHostClean..."
    $pattern = "^[0-9]"
    $isNumeric = $remoteHost -match $pattern
    if ($isNumeric)
    {
        $netstatCommand =  netstat -an | Select-String $remoteHostClean 
    }
    else 
    {
        $netstatCommand =  netstat -a | Select-String $remoteHostClean 
    }
    Write-Host $netstatCommand
}