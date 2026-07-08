$ErrorActionPreference = "Stop"

. "$PSScriptRoot\scripts\helpers.ps1"

& "$PSScriptRoot\scripts\install-apps.ps1"
& "$PSScriptRoot\scripts\install-fonts.ps1"
& "$PSScriptRoot\scripts\setup-powershell.ps1"
& "$PSScriptRoot\scripts\setup-windows-terminal.ps1"

Write-Host "Development set completed." -ForegroundColor Green