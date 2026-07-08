[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\dracula.omp.json" | Invoke-Expression
}

Import-Module PSReadLine -ErrorAction SilentlyContinue

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
