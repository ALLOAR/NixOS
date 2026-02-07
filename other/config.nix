{ config, pkgs, lib, ... }: 
{
  programs.hyprland.enable = true;
  programs.zsh.enable = true;
  programs.git.enable = true;
  
  services.openssh.enable = true;
  services.tailscale.enable = true;


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
                        "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
                        };
                };
        };
  };
  security.rtkit.enable = true;
}
