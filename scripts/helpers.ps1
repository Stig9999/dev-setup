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

function Ensure-WingetPackage {
    param(
        [Parameter(Mandatory)]
        [string] $Id
    )

    $installed = winget list --id $Id --exact | Select-String $Id

    if (-not $installed) {
        Write-Info "Installing $Id..."

        winget install `
            --id $Id `
            --exact `
            --source winget `
            --accept-package-agreements `
            --accept-source-agreements `
            --silent

        Write-Success "$Id installed."
        return
    }

    $upgrade = winget upgrade --id $Id --exact | Select-String $Id

    if ($upgrade) {
        Write-Info "Upgrading $Id..."

        winget upgrade `
            --id $Id `
            --exact `
            --source winget `
            --accept-package-agreements `
            --accept-source-agreements `
            --silent

        Write-Success "$Id upgraded."
    }
    else {
        Write-Info "$Id is already up to date."
    }
}
