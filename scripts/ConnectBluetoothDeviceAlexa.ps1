

# "Disable-PnpDevice" and "Enable-PnpDevice" commands require admin rights
#Requires -RunAsAdministrator

# Substitute it with the name of your audio device.
# The audio device you are trying to connect to should be paired.
$deviceName = "Echo Dot-3M1"

$bluetoothDevices = Get-PnpDevice -class Bluetooth

$headphonePnpDevices = $bluetoothDevices | Where-Object { $_.Name.StartsWith("$deviceName") }

if(!$headphonePnpDevices) {
    Write-Host "Coudn't find any devices related to the '$deviceName'"
    Write-Host "Whole list of available devices is:"
    $bluetoothDevices
    return
}

Write-Host "The following PnP devices related to the '$deviceName' headphones found:"
ForEach($d in $headphonePnpDevices) { $d }

Write-Host "`nDisable all these devices"
ForEach($d in $headphonePnpDevices) { Disable-PnpDevice -InstanceId $d.InstanceId -Confirm:$false }

Write-Host "Enable all these devices"
ForEach($d in $headphonePnpDevices) { Enable-PnpDevice -InstanceId $d.InstanceId -Confirm:$false }


Write-Host "The headphones should be connected now."