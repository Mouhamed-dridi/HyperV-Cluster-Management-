$computers = Get-ADComputer -Filter * -SearchBase "OU=Computers,DC=misfat.com,DC=com"
foreach ($computer in $computers) {
    $result = Invoke-Command -ComputerName $computer.Name -ScriptBlock {param($result) $result = Get-WmiObject -Class "win32_pendingoperationalstatus" -Namespace "root\ccm\clientSDK" | Select-Object -ExpandProperty "operationalstatus" -ErrorAction SilentlyContinue; if ($result -eq 1) {$true} else {$false}} -ArgumentList $result -ErrorAction SilentlyContinue
    if ($result) {
        Write-Host "The computer $($computer.Name) needs a reboot."
    }
}
