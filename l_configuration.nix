{ config, lib, pkgs, ... }:

{
  imports = [ 
	./hardware-configuration.nix
        ./nixos-hardware/lenovo/ideapad/15ach6/default.nix
	./other/laptop.nix
	./other/packages.nix
	./other/stuff.nix
	./other/config.nix
	
    ];
}


