function Write-Step {
    param(
        [Parameter(Mandatory)]
        [string] $Message
    )

    Write-Host
    Write-Host "==> $Message" -ForegroundColor Cyan
}

function Write-Success {
    param(
        [Parameter(Mandatory)]
        [string] $Message
    )

    Write-Host "✔  $Message" -ForegroundColor Green
}

function Write-Info {
    param(
        [Parameter(Mandatory)]
        [string] $Message
    )

    Write-Host "•  $Message" -ForegroundColor DarkGray
}

function Write-Warning {
    param([Parameter(Mandatory)][string] $Message)

    Write-Host "⚠  $Message" -ForegroundColor Yellow
}

function Copy-File {
    param(
        [Parameter(Mandatory)]
        [string] $Source,

        [Parameter(Mandatory)]
        [string] $Destination
    )

    $directory = Split-Path $Destination

    if (-not (Test-Path $directory)) {
        New-Item -ItemType Directory -Path $directory -Force | Out-Null
    }

    Copy-Item -Path $Source -Destination $Destination -Force
}

function Install-WingetPackage {
    param(
        [Parameter(Mandatory)]
        [string] $Id
    )

    if (winget list --id $Id --exact | Select-String $Id) {
        Write-Info "$Id is already installed."
        return
    }

    Write-Info "Installing $Id..."

    winget install `
        --id $Id `
        --exact `
        --source winget `
        --accept-package-agreements `
        --accept-source-agreements

    Write-Success "$Id installed."
}

function Upgrade-WingetPackage {
    param(
        [Parameter(Mandatory)]
        [string] $Id
    )

    if (winget upgrade --id $Id --exact | Select-String $Id) {
        Write-Info "Upgrading $Id..."

        winget upgrade `
            --id $Id `
            --exact `
            --source winget `
            --accept-package-agreements `
            --accept-source-agreements

        Write-Success "$Id upgraded."
        return
    }

    Write-Info "$Id is already up to date."
}
