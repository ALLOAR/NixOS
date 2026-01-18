{ config, lib, pkgs, ... }:

{
  imports = [
	./hardware-configuration.nix
	./other/nvidia.nix
	./other/packages.nix
	./other/stuff.nix
	./other/config.nix
	./other/game.nix
	
    ];
}
