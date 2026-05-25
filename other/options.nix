{ pkgs, lib, config, ... }: {

options = {
	gaming.enable = lib.mkEnableOption "gaming stuff";
};

config = lib.mkIf config.gaming.enable {
	programs.steam.enable =	lib.mkDefault true;
	hardware.opengl.enable = lib.mkDefault true;
};

}
