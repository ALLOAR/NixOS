{
  description = "The most kawai NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  {
    nixosConfigurations = {

      pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./p_configuration.nix
	home-manager.nixosModules.home-manager
	{
	home-manager.users.alloar = import ./home.nix;
	}
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./l_configuration.nix
        ];
      };

    };
  };
}
