{ pkgs, lib, config, ... }: {

options = {
	gaming.enable = lib.MakeEnableOption "gaming stuff";
};

config = lib.mkIf config.gaming.enable {
	programs.steam.enable =	lib.MkDefault true;
	hardware.opengl.enable = lib.MkDefault true;
};

}
