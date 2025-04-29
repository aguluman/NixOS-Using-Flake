{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11"
  ];
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "terraform"
  ];

  # Common packages for all systems
  environment.systemPackages = with pkgs; [
    git
    logseq
    docker
    kubectl
    minikube
    terraform
    jenkins
    dotnet-sdk
    dotnet-sdk_9
    postgresql
    sqlite
    electron
    openssl
    curl
    jq
    nodejs
    nodePackages.typescript
    wget
    lsof
  ];

  # Common services
  services.openssh.enable = true;
  virtualisation.docker.enable = true;
  services.postgresql.enable = true;
  
  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}