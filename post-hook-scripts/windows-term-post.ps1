param(
    [Parameter(Mandatory=$true)]
    [string]$SchemePath
)

$storePath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$standalonePath = "$env:LOCALAPPDATA\Microsoft\Windows Terminal\settings.json"

if (Test-Path $storePath) {
    $p = $storePath
} elseif (Test-Path $standalonePath) {
    $p = $standalonePath
} else {
    Write-Error "Windows Terminal settings not found (checked Store and standalone locations)"
    exit 1
}

$n = Get-Content $SchemePath | ConvertFrom-Json
$s = Get-Content $p | ConvertFrom-Json
$s.schemes = @($s.schemes | Where-Object { $_.name -ne $n.name }) + $n
$s | ConvertTo-Json -Depth 10 | Set-Content $p
