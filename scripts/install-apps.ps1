Write-Step "Installing applications"

$packages = @(
    "Microsoft.PowerShell",
    "Microsoft.WindowsTerminal",
    "JanDeDobbeleer.OhMyPosh",
    "JetBrains.Toolbox",
    "Microsoft.VisualStudioCode",
    "Kubernetes.kubectl",
    "Docker.DockerDesktop"
)

foreach ($package in $packages) {
    Install-WingetPackage $package
}

Write-Success "Applications installed."
