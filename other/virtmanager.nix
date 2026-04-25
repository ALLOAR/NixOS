{ pkgs-stable, pkgs, ... }: {
  services {
	qemuGuest.enable = true;
	spice-vdagent.enble = true;
	spice-autorandr.enble = true;
  };
  virtualisation {
	libvirtd.enable = true;
	spiceUSBRedirection.enable = true;
	libvirtd.qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };
  programs.virt-manager.enable = true;
}
