$packages = @(
    "Microsoft.WindowsTerminal",
    "Microsoft.PowerShell",
    "JanDeDobbeleer.OhMyPosh",
    "JetBrains.Toolbox",
    "Git.Git"
)

foreach ($package in $packages) {
    Install-WingetPackage $package
}
