{ config, lib, pkgs, ... }:

{
  # Include your Latitude-specific hardware configuration
  imports = [ ./hardware-configuration.nix ];
  
  # Boot loader, networking, etc.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  networking.hostName = "latitude";
  networking.networkmanager.enable = true;
  
  # Latitude-specific packages
  environment.systemPackages = with pkgs; [
    # Power management
    powertop
    tlp
    acpi
    
    # Display and graphics
    brightnessctl
    
    # Networking utilities
    networkmanager
    networkmanagerapplet
    bluez
    blueman
    
    # Peripherals management
    xorg.xbacklight
    
    # System monitoring
    lm_sensors
    htop
    
    # Dell-specific tools
    ipmitool  # For hardware monitoring if available
    
    # File managers & utilities for desktop environment
    xfce.thunar
    gnome.nautilus
    
    # Audio
    pavucontrol
    pulseaudio
  ];
  
  # Enable power management
  services.tlp.enable = true;
  services.thermald.enable = true;
  
  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  
  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  
  # Enable touchpad support
  services.xserver.libinput.enable = true;
}