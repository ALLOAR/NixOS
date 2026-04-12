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
boot.resumeDevice = "/dev/disk/by-uuid/b42fb6d8-c053-47bc-a4ea-baba0bef2cab";
boot.kernelParams = [ "resume_offset=7569408"];
boot.initrd.systemd.enable = true; # если ещё не включён

}
