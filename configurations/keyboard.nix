{ config, pkgs, ... }: {
services.xserver = {
  xkb.layout = "us,ru";
  xkbOptions = "grp:win_space_toogle";
};
}  
