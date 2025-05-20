$results = @{}

# Win32PrioritySeparation
$priority = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -ErrorAction SilentlyContinue
$results["Win32PrioritySeparation"] = if ($priority.Win32PrioritySeparation -eq 38) {"✅ Set to 0x26 (38)"} else {"❌ Not set to 0x26 (current: $($priority.Win32PrioritySeparation))"}

# SystemResponsiveness
$responsive = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -ErrorAction SilentlyContinue
$results["SystemResponsiveness"] = if ($responsive.SystemResponsiveness -eq 10) {"✅ Set to 0x0A (10)"} else {"❌ Not set to 0x0A (current: $($responsive.SystemResponsiveness))"}

# PowerThrottlingOff
$throttle = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" -Name "PowerThrottlingOff" -ErrorAction SilentlyContinue
$results["PowerThrottlingOff"] = if ($throttle.PowerThrottlingOff -eq 1) {"✅ Set to 1 (Disabled)"} else {"❌ Not set to 1 (current: $($throttle.PowerThrottlingOff))"}

# CoalescingTimerInterval Attributes
$key1 = "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5d76a2ca-e8c0-402f-a133-2158492d58ad\8335251-82be-4824-96c1-47b60b7400d0"
$key2 = "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\5d76a2ca-e8c0-402f-a133-2158492d58ad\0cc5b647-c1df-4637-891a-dec35c318583"

$attr1 = Get-ItemProperty -Path $key1 -Name "Attributes" -ErrorAction SilentlyContinue
$results["CoalescingTimerInterval - Attributes"] = if ($attr1.Attributes -eq 0) {"✅ Set to 0"} else {"❌ Not set to 0 (current: $($attr1.Attributes))"}

$attr2 = Get-ItemProperty -Path $key2 -Name "Attributes" -ErrorAction SilentlyContinue
$val2 = Get-ItemProperty -Path $key2 -Name "Value" -ErrorAction SilentlyContinue
$results["ProcessorIdleDemoteThreshold - Attributes"] = if ($attr2.Attributes -eq 0) {"✅ Set to 0"} else {"❌ Not set to 0 (current: $($attr2.Attributes))"}
$results["ProcessorIdleDemoteThreshold - Value"] = if ($val2.Value -eq 0) {"✅ Set to 0"} else {"❌ Not set to 0 (current: $($val2.Value))"}

$results.GetEnumerator() | ForEach-Object { Write-Output "$($_.Key): $($_.Value)" }
Pause
