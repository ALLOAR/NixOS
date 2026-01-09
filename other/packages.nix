{ config, lib, pkgs, ... }:
{

environment.systemPackages = with pkgs; [
	# GAMING STUFF	
	vulkan-tools
	vulkan-loader
	vulkan-validation-layers
	mesa-demos
	
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installe>
        neovim
        wget
        git
        firefox
        hyprland
        hyprpaper
        stow
        waybar
        wofi
        alacritty
        xfce.thunar
        pavucontrol
        pipewire
        rtkit
        btop
        htop
        bluez
        zsh-powerlevel10k
        oh-my-zsh
        zsh
	 wl-clipboard
        fastfetch
        ufetch
        steam
        lshw
        tlp
        hdparm
        telegram-desktop
        discord
        #pv
        brightnessctl

];
  fonts.enableFontDir = true;

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    pkgs.nerd-fonts._0xproto
    pkgs.nerd-fonts.droid-sans-mono
  ];

  nixpkgs.config.allowUnfree = true;

}


