$ErrorActionPreference = "Stop"

Write-Step "Installing applications"

$packages = @(
    "Git.Git",
    "Microsoft.PowerShell",
    "Microsoft.WindowsTerminal",
    "JanDeDobbeleer.OhMyPosh",
    "JetBrains.Toolbox",
    "Microsoft.VisualStudioCode",
    "Docker.DockerDesktop"
)

foreach ($package in $packages) {
    Ensure-WingetPackage $package
}

Write-Success "Applications installed."
