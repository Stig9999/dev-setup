$ErrorActionPreference = "Stop"

$repository = "https://github.com/Stig9999/dev-setup.git"
$installPath = "$HOME\dev-setup"

function Install-WingetPackage {
    param([string]$Id)

    if (-not (winget list --exact --id $Id | Select-String $Id)) {
        Write-Host "Installing $Id..."
        winget install `
            --id $Id `
            --exact `
            --source winget `
            --accept-package-agreements `
            --accept-source-agreements
    }
}

Write-Host "Installing Git..."
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

& "$installPath\install.ps1"