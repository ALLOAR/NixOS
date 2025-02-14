{ config, pkgs, ... }:

{
hardware = {
	bluetooth.enable = true;
	bluetooth.powerOnBoot = true;
};
services.blueman.enable = true;
}
