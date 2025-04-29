{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }: {
    nixosConfigurations = {
      # WSL configuration
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.default
          ./hosts/wsl
          ./common
          {
            system.stateVersion = "24.11";
          }
        ];
      };
      
      # Latitude laptop configuration
      latitude = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/latitude
          ./common
          {
            system.stateVersion = "24.11";
          }
        ];
      };
    };
  };
}