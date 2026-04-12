{ config, lib, pkgs, ... }: {

zramSwap = {
	enable = true;
    priority = 100;
    algorithm = "lz4";
    memoryPercent = 50;
};

swapDevices = [{
	device = "/var/lib/swapfile";
	size = 16*1024; # 16 GB
}];

# Hybernate stuff
boot.resumeDevice = "/dev/disk/by-uuid/dc489b50-1912-4858-af96-547dfddfc754";
boot.kernelParams = [ "resume_offset=51611648" ];
boot.initrd.systemd.enable = true; # если ещё не включён

}
