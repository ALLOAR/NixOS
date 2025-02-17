{ config, pkgs, ... }: {
	home = {
		username = "alloar";
		homeDirectory= "/home/alloar";
		stateVersion = "24.11";
	};
	
	imports = [
	./home_configs/zsh.nix
	./home_configs/programsh.nix
	./home_configs/waybar.nix
	./home_configs/alacritty.nix
];
}

