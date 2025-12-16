{ config, lib, pkgs, ... }: {
 hardware.graphics = {
	enable = true;
  };

  hardware.nvidia = {
	modesetting.enable = true;
	open = false;
	nvidiaSettings = true;
  };

services.xserver.videoDrivers = ["nvidia"];
hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
}
