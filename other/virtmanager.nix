{ pkgs-stable, pkgs, ... }: {
  services = {
	qemuGuest.enable = true;
	spice-autorandr.enable = true;
	spice-vdagentd.enable = true;
  };
  virtualisation = {
	libvirtd = { 
		enable = true;

	  qemu = {
		package = pkgs.qemu_kvm;
		swtpm.enable = true;
      };
	};
	spiceUSBRedirection.enable = true;
	libvirtd.qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };
  programs.virt-manager.enable = true;
}
