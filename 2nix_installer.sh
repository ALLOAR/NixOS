#!/bin/bash
set -e
cd
echo "  [1/2] "
echo "-- what you want ---"
choise=$(gum choose update new_system update_nix update_home)
echo "You want that $choise?"

cd
echo -e "\e[32mCloning main git\e[0m"
git clone --branch main --single-branch https://github.com/ALLOAR/NixOS
cd NixOS
mkdir -p ~/save_nix_configs
mkdir -p /etc/nixos/configurations
mkdir -p ~/.config
mkdir -p ~/.config/home-manager/

case "$choise" in
  update) cp -r /etc/nixos/* ~/save_nix_configs/ 
	  cp -r * /etc/nixos/
	  rm -rf NixOS
	  git clone --branch home --single-branch https://github.com/ALLOAR/NixOS > /dev/null 2>&1
	  cd NixOS 
	  cp -r * ~/.config/home-manager/
	  cd
	  ;;
  new_system) cp -r * /etc/nixos/ && cd
	  echo -e "\e[32m Cloning home git\e[0m"
	  git clone --branch home --single-branch https://github.com/ALLOAR/NixOS > /dev/null 2>&1
	  cd NixOS
	  cp -r * ~/.config/home-manager/ 
	  ;;



    echo "cloning git"
    git clone --branch home --single-branch https://github.com/ALLOAR/NixOS > /dev/null 2>&1
    cd NixOS
    cp hyprland.conf ~/.config/hypr/
    cp -r * ~/.config/home-manager
    cd ~/.config/home-manager
    rm -rf NixOS
fi
if [ -d ~/.ssh ]; then
    echo "ssh key already exist"
else
    echo "generating ssh key"
    printf "\n\n\n" | ssh-keygen -t ed25519 -C "evgenzbiranik@gmail.com" > /dev/null 2>&1
    printf "\n\n\n" | sudo ssh-keygen -t ed25519 -C "evgenzbiranik@gmail.com" > /dev/null 2>&1
fi
