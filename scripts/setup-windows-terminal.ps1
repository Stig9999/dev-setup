$ErrorActionPreference = "Stop"

Write-Step "Configuring Windows Terminal"

$source = Join-Path $PSScriptRoot "..\terminal\settings.json"

$terminalPackage = Get-ChildItem `
    (Join-Path $env:LOCALAPPDATA "Packages") `
    -Directory `
    -Filter "Microsoft.WindowsTerminal_*" |
    Select-Object -First 1

if (-not $terminalPackage) {
    throw "Windows Terminal installation could not be found."
}

Copy-File `
    -Source $source `
    -Destination (Join-Path $terminalPackage.FullName "LocalState\settings.json")

Write-Success "Windows Terminal configured."