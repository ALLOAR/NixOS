{ config, pkgs, lib, ... }: 
{
#  programs.hyprland.enable = true
  services.hypridle.enable = true;
  programs.niri.enable = true;
  programs.zsh.enable = true;
  programs.git.enable = true;
  services.blueman.enable = true;
  programs.xwayland.enable = true;

  programs.neovim.enable = true;
  programs.bash.enable = true;
  programs.vim.enable = true;


 swapDevices = [{
  	device = "/var/lib/swapfile";
  	size = 16*1024; # 16 GB
	priority = 10;
  }];

  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "lz4";
    memoryPercent = 50;
  };

  services.tailscale.enable = true;
  services.openssh = {
  enable = true;
  ports = [ 2222 ];
  	settings = {
  	  	PasswordAuthentication = true;
    		KbdInteractiveAuthentication = false;
    		PermitRootLogin = "no";
    		AllowUsers = [ "alloar" ];
  	};
  };

 
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

  services = {
        pipewire = {
                enable = true;
                alsa.enable = true;
                alsa.support32Bit = true;
                
		pulse.enable = true;
                # If you want to use JACK applications, uncomment this
                #jack.enable = true;
                wireplumber.extraConfig.bluetoothEnhancements = {
                        "monitor.bluez.properties" = {
                        #"bluez5.enable-sbc-xq" = true; # this enable good qulity, but its unstable
                        "bluez5.enable-msbc" = true;
                        "bluez5.enable-hw-volume" = true;
						"bluez5.roles" = [ "a2dp_source" "hsp_ag" "hfp_ag"  ]; # can be added "hsp_hs" and "hfp_hf" but problems can occu
						"bluez5.profile" = "a2dp-sink";
# Bluez5.roles: 
						};
                };
        };
  };
hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
  settings = {
    General = {
      # Shows battery charge of connected devices on supported
      # Bluetooth adapters. Defaults to 'false'.
      Experimental = true;
      # When enabled other devices can connect faster to us, however
      # the tradeoff is increased power consumption. Defaults to
      # 'false'.
      FastConnectable = true;
	  MultiProfile = "multiple";
    };
    Policy = {
      # Enable all controllers when they are found. This includes
      # adapters present on start as well as adapters that are plugged
      # in later on. Defaults to 'true'.
      AutoEnable = true;
    };
  };
};	
  security.rtkit.enable = true;
 
# Here will be some stuff what I never will touch

  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #networking.hostName = "laptop"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by defaul
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  #networking.wireless = {
  #  enable = true;
  #  networks."mySSID".psk = "myPSK";
  #  extraConfig = "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=wheel";
    # output ends up in /run/wpa_supplicant/wpa_supplicant.conf
  #};


  time.timeZone = "Europe/Warsaw";

  users.users.alloar = {
     isNormalUser = true;
     extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };

  #services.displayManager.gdm.enable = true;
 
  virtualisation.docker.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";

  environment.variables = {
    DISPLAY = ":0";
};
}
