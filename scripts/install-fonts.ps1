$ErrorActionPreference = "Stop"

if (-not (Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
    throw "oh-my-posh must be installed before installing fonts."
}

oh-my-posh font install CaskaydiaCove
