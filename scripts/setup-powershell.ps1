$ErrorActionPreference = "Stop"

Write-Step "Configuring PowerShell"

$profileSource = Join-Path $PSScriptRoot "..\powershell\Microsoft.PowerShell_profile.ps1"
$profileDestination = $PROFILE.CurrentUserCurrentHost

Copy-File `
    -Source $profileSource `
    -Destination $profileDestination

Write-Success "PowerShell profile configured."
