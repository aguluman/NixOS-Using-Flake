{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ 
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # Use the systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # File systems configuration - update with your actual partitions
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/YOUR-UUID-HERE"; # Replace with actual UUID
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/YOUR-BOOT-UUID-HERE"; # Replace with actual UUID
    fsType = "vfat";
  };

  swapDevices = [ 
    { device = "/dev/disk/by-uuid/YOUR-SWAP-UUID-HERE"; } # Replace or remove if not using swap
  ];

  # CPU settings
  hardware.cpu.intel.updateMicrocode = true;

  # Enable touchpad support
  hardware.trackpoint.enable = true;
  hardware.trackpoint.emulateWheel = true;
  services.libinput.enable = true;
  services.libinput.touchpad.tapping = true;
  services.libinput.touchpad.naturalScrolling = true;

  # Hardware-specific modules - uncomment if needed
  # boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  # boot.initrd.kernelModules = [ ];
  # boot.kernelModules = [ "kvm-intel" ];
  # boot.extraModulePackages = [ ];
}