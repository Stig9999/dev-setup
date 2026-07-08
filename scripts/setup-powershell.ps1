$ErrorActionPreference = "Stop"

Write-Host "Configuring PowerShell..." -ForegroundColor Cyan

Copy-File `
    -Source (Join-Path $PSScriptRoot "..\powershell\Microsoft.PowerShell_profile.ps1") `
    -Destination $PROFILE.CurrentUserCurrentHost
