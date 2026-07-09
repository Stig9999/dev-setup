$ErrorActionPreference = "Stop"

$repository = "https://github.com/Stig9999/dev-setup.git"
$installPath = Join-Path $HOME "dev-setup"

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    throw "winget was not found. Install App Installer from Microsoft Store."
}

function Install-WingetPackage {
    param([string]$Id)

    if (-not (winget list --exact --id $Id | Select-String $Id)) {
        Write-Host "Installing $Id..."
        winget install `
            --id $Id `
            --exact `
            --source winget `
            --accept-package-agreements `
            --accept-source-agreements `
            --silent
    }
}

Write-Host "Installing Git..." -ForegroundColor Cyan
Install-WingetPackage "Git.Git"

# Refresh PATH so git is immediately avaiable
$env:Path =
[System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" +
[System.Environment]::GetEnvironmentVariable("Path", "User")

if (!(Test-Path $installPath)) {
    git clone $repository $installPath
}
else {
    git -C $installPath pull
}

& (Join-Path $installPath "install.ps1")
