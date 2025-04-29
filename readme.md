# NixOS Configuration

## Getting Started

1. Clone this repository
2. Apply the configuration:

# NixOS Configuration Repository

A centralized, flake-based NixOS configuration for multiple systems. This repository serves as a single source of truth for NixOS configurations across different devices.


### For WSL environment
sudo nixos-rebuild switch --flake .#nixos

### For Dell Latitude laptop
sudo nixos-rebuild switch --flake .#latitude