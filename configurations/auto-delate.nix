{ config, pkgs, ... }:

{
nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delate-older-then 5d";
};
}
