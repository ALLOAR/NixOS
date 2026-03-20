{ config, lib, pkgs, ... }: {
	fileSystems."/home/alloar/data" = {
  	device = "/dev/disk/by-uuid/b0655de8-7a69-4496-adbf-c1b5c1503258";
  	fsType = "ext4";
  	options = [ "defaults" "nofail" "exec" ];
};
}
