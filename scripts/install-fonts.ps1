$ErrorActionPreference = "Stop"

Write-Step "Installing fonts"

if (-not (Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
    throw "Oh My Posh must be installed before installing fonts."
}

$font = "CascadiaCode"

Write-Info "Installing $font Nerd Font..."
oh-my-posh font install $font

Write-Success "$font Nerd Font installed."
