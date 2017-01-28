$pathToCSVFile = "GrizzlySteppeConnections.csv"
$ipAddresses = get-content -path $pathToCSVFile | select-object -skip 1
foreach ($ipAddress in $ipAddresses)
{
    $ipAddressClean = $ipAddress -replace "\[","" -replace "\]","" -replace ",",""
    write-host "Connections for $ipAddressClean..."
    $netstatCommand =  netstat -an | Select-String $ipAddressClean
    Write-Host $netstatCommand
}