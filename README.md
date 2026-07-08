# Dev Setup

This repository contains scripts and configuration for bootstrapping a new Windows development machine.

## Getting Started

Open **PowerShell** and run the following command:

```powershell
irm https://raw.githubusercontent.com/Stig9999/dev-setup/main/bootstrap.ps1 | iex
```

The bootstrap script will:

- Install Git (if it's not already installed)
- Clone this repository to your machine
- Execute the installation script
- Install and configure your development environment

> [!NOTE]
> The bootstrap script is designed to be idempotent, meaning it can be run multiple times without causing duplicate installations or unwanted side effects.
