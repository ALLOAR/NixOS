{ config, pkgs, ... }: {
	home = {
		username = "alloar";
		homeDirectory= "/home/alloar";
		stateVersion = "25.11";
	};
	
	imports = [
	./a-configs/zsh.nix
	#./home-configs/alacritty.nix
	./a-configs/git.nix
	./a-configs/nvim.nix
	./a-configs/dunst.nix
];
}
