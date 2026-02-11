{ config, pkgs, ... }: {
	home = {
		username = "alloar";
		homeDirectory= "/home/alloar";
		stateVersion = "25.05";
	};
	
	imports = [
	./a-configs/zsh.nix
	#./home-configs/alacritty.nix
	./a-configs/git.nix
];
}
