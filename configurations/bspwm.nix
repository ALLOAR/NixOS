{ config, pkgs, ... }: {
  services.xserver.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
}
