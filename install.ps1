$ErrorActionPreference = "Stop"

. "$PSScriptRoot\scripts\helpers.ps1"

Write-Step "Installing development setup"

& "$PSScriptRoot\scripts\install-apps.ps1"
& "$PSScriptRoot\scripts\install-fonts.ps1"
& "$PSScriptRoot\scripts\setup-powershell.ps1"
& "$PSScriptRoot\scripts\setup-windows-terminal.ps1"

Write-Success "Development setup completed."
