# Path to Windows Terminal settings
$p = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
# Load the new scheme from the specified JSON file
$n = Get-Content "C:\Windows\Temp\matugen_windows_term.json" | ConvertFrom-Json 
# Load existing settings
$s = Get-Content $p | ConvertFrom-Json 
# Remove any existing scheme with the same name and add the new scheme
$s.schemes = @($s.schemes | Where-Object { $_.name -ne $n.name }) + $n
# Save the updated settings back to the file with sufficient depth to preserve structure
$s | ConvertTo-Json -Depth 10 | Set-Content $p