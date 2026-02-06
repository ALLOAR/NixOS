{ config, lib, pkgs, ... }:
{

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #networking.hostName = "laptop"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  
  time.timeZone = "Europe/Warsaw";

  #services.displayManager.gdm.enable = true;
  
  
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha-mauve";
    # Enables experimental Wayland support
    wayland.enable = true;
  };

  environment.systemPackages = [ 
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
    })
  ];

  users.users.alloar = {
     isNormalUser = true;
     extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };

  virtualisation.docker.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";

}
