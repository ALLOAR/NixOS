{ config, lib, pkgs, ... }:

{
  imports = [
	./hardware-configuration.nix
	../other/nvidia.nix
	../other/packages.nix
	../other/config.nix
	../other/game.nix
	../other/disk.nix
	./other/swap.nix
	
    ];
}
