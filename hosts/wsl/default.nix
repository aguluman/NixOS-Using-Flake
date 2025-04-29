{ config, lib, pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "nixos";
  
  nix.settings.download-buffer-size = 20000000;

  fileSystems."/" = {
    device = "/dev/sdd";
    fsType = "ext4";
  };

  boot.loader.grub.enable = false;
}