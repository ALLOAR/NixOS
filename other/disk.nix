{ config, lib, pkgs, ... }: {
	fileSystems."/data" = {
  	device = "/dev/disk/by-uuid/0d328496-0e78-46ec-8d42-39d9535e4af1";
  	fsType = "ext4";
  	options = [ "defaults" "nofail" ];
};
}
