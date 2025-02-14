{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
    # Desktop apps
	audacity
	chromium
	telegram-desktop
	alacritty
	obs-studio
	rofi
	wofi
	mpv
	kdenlive
	discord
	gparted
	obsidian
	zoom-us
	pcmanfm-qt
	#polymc
	firefox
	spotify
	youtube-music
	btop
	htop
	acpi			
	# Hyprland stuff
	hyprland
	hyprpaper
	hyprlock
	dolphin
	steam
	oh-my-zsh
	zsh-powerlevel10k		
	virtualbox
 	vulkan-tools
  	glxinfo
  	nvtop
	clinfo
	vulkan-headers
	vulkan-loader
	vulkan-validation-layers
  	nvidia-vaapi-driver
  	libva		
	nvidia-vaapi-driver
	shotcut
    # Coding stuff
    git
    vscode
    gnumake
    gcc
    nodejs
    #python
    #(python3.withPackages (ps: with ps; [ requests ]))
    #python39Full
    vim
    python314
    # CLI utils
    neofetch
    file
    tree
    wget
    wget
    fastfetch
    htop
    nix-index
    unzip
    scrot
    ffmpeg
    light
    lux
    mediainfo
    ranger
    zram-generator
    cava
    zip
    ntfs3g
    yt-dlp
    brightnessctl
    swww
    openssl
    lazygit
    bluez
    bluez-tools

    # GUI utils
    feh
    imv
    dmenu
    screenkey
    mako
    gromit-mpx

    # Xorg stuff
    #xterm
    #xclip
    #xorg.xbacklight

    # Wayland stuff
    xwayland
    wl-clipboard
    cliphist
    wayland
    # WMs and stuff
    herbstluftwm
    hyprland
    seatd
    xdg-desktop-portal-hyprland
    polybar
    waybar

    # Sound
    pipewire
    pulseaudio
    pamixer
    pavucontrol
    blueman
    # GPU stuff 
    amdvlk
    #rocm-opencl-icd
    glaxnimate

    # Screenshotting
    grim
    grimblast
    slurp
    flameshot
    swappy

    # Other
    home-manager
    spice-vdagent
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    papirus-nord
    sxhkd
    wezterm
    fish
    dunst
    zsh
    accountsservice
    gdm-settings
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
