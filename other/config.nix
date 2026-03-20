{ config, pkgs, lib, ... }: 
{
#  programs.hyprland.enable = true
  services.hypridle.enable = true;
  programs.niri.enable = true;
  programs.zsh.enable = true;
  programs.git.enable = true;
  services.blueman.enable = true;
  programs.xwayland.enable = true;

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
                        "bluez5.enable-sbc-xq" = true;
                        "bluez5.enable-msbc" = true;
                        "bluez5.enable-hw-volume" = true;
						"bluez5.roles" = [ "a2dp_sink" "hsp_hs" "hfp_hf" ];
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
  environment.variables = {
  DISPLAY = ":0";
};
}
