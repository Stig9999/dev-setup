function Install-WingetPackage {
    param(
        [Parameter(Mandatory)]
        [string] $Id
    )

    if (winget list --id $Id --exact | Select-String $Id) {
        Write-Host "$Id already installed" -ForegroundColor DarkGray
        return
    }

    Write-Host "Installing $Id..." -ForegroundColor Yellow

    winget install `
        --id $Id `
        --exact `
        --source winget `
        --accept-package-agreements `
        --accept-source-agreements
}
