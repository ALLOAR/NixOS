# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
	#<nixos-hardware/lenovo/ideapad/15ach6>
	./hardware-configuration.nix
        ./nixos-hardware/lenovo/ideapad/15ach6/default.nix
	./other/packages.nix
	./other/stuff.nix
	./other/config.nix
	
    ];

  # Use the systemd-boot EFI boot loader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
	
  
#  security.rtkit.enable = true;

#  services = {
#	pipewire = {
#		enable = true;
#		alsa.enable = true;
#		alsa.support32Bit = true;
#		pulse.enable = true;
#		# If you want to use JACK applications, uncomment this
#		#jack.enable = true;
#		wireplumber.extraConfig.bluetoothEnhancements = {
#			"monitor.bluez.properties" = {
#			"bluez5.enable-sbc-xq" = true;
#			"bluez5.enable-msbc" = true;
#			"bluez5.enable-hw-volume" = true;
#			"bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
 # 			};
  #		};
  #	};  
  #};

#   networking.hostName = "nixos"; # Define your hostname.
#   networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
#   time.timeZone = "Europe/Warsaw";


  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
#   users.users.alloar = {
#     isNormalUser = true;
#     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
#     packages = with pkgs; [
#       tree
#     ];
#   };

  # programs.firefox.enable = true;
#  programs.hyprland.enable = true;
#  programs.zsh.enable = true;
#  programs.git.enable = true;    
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
#  environment.systemPackages = with pkgs; [
#	vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
#	neovim
#	wget
#	git
#	firefox
#	hyprland
#	hyprpaper
#	stow
#	waybar
#	wofi
#	alacritty
#	xfce.thunar
#	pavucontrol
#	pipewire
#	rtkit
#	btop
#	htop
#	bluez
#	zsh-powerlevel10k
#	oh-my-zsh
#	zsh
#	wl-clipboard
#	fastfetch
#	ufetch
#	steam
#	lshw
#	tlp
#	hdparm
#	telegram-desktop
#	discord
#	#pv
#	brightnessctl
#  ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # w};

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
#  system.stateVersion = "25.05"; # Did you read the comment?
#  nixpkgs.config.allowUnfree = true;
#  fonts.enableFontDir = true;  

#  fonts.packages = with pkgs; [
#    jetbrains-mono
#    noto-fonts
#    noto-fonts-emoji
#    twemoji-color-font
#    font-awesome
#    powerline-fonts
#    powerline-symbols
#    pkgs.nerd-fonts._0xproto
#    pkgs.nerd-fonts.droid-sans-mono    
#  ];
}


