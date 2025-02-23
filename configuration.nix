# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
#f
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
	./configurations/hardware-configuration.nix
	./configurations/programs.nix
	./configurations/auto-delate.nix
	./configurations/bluetooth.nix
	#./configurations/amd.nix
	#./configurations/nvidia.nix
	./configurations/nvidia_prime.nix
    ];
  #services.logind.extraConfig = ''
  #HandleLidSwitch=ignore
  #HandleLidSwitchDocked=ignore
  #'';
  
  #hardware.opengl = {
   # enable = true;
    #extraPackages = with pkgs; [
     # nvidia-vaapi-driver
      #vulkan-validation-layers
      #vulkan-utility-libraries
    #];
  #};

  #boot.kernelParams = [ 
  #"nvidia_drm.modeset=1" 
  #"nvidia.NVreg_RegistryDwords=OverrideMaxPerf=0x1"
  #];
  #boot.kernelPackages = pkgs.linuxPackages_latest;

  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
  enable = true;
  enableCompletion = true;
  #autoSuggestion.enable = true;
  #syntaxHighlighting.enable = true;
  };

  #hardware.graphics.enable32Bit = true;
  #hardware.opengl.extraPackages = with pkgs; [
  #amdvlk
  #];
  #services.xserver.enable = true;
  #services.xserver.videoDrivers = [ "amdgpu" ];
  # For 32 bit applications 
  #hardware.opengl.extraPackages32 = with pkgs; [
  #driversi686Linux.amdvlk
  #];  

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  programs.hyprland.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  #services.xserver.DesktopManager.hyprland.enable = true;
  #services.xserver.enable = false;
  #services.wayland.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  users.users.alloar = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "alloar";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11"; # Did you read the comment?

}

