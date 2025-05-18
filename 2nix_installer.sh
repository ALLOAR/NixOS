#!/bin/bash
set -e
cd
echo "  [1/2] "
if [ -d "/etc/nixos/configurations" ]; then
    echo "Директория configurations существует"
    echo "Установка Конфигураций не нужна"
else
    mkdir -p /etc/nixos/configurations
    curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configuration.nix -o /etc/nixos/configurations/configuration.nix > /dev/null 2>&1
    curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/programs.nix -o /etc/nixos/configurations/programs.nix > /dev/null 2>&1
    curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/amd.nix -o /etc/nixos/configurations/amd.nix > /dev/null 2>&1
    curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia.nix -o /etc/nixos/configurations/nvidia.nix > /dev/null 2>&1
    curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia_prime.nix -o /etc/nixos/configurations/nvidia_prime.nix > /dev/null 2>&1
fi
cd
if [ -d "~/.config/hypr" ]; then
    echo "Директория существует"
else
    mkdir -p ~/.config
    mkdir -p ~/.config/hypr/
    mkdir -p ~/.config/home-manager
fi

echo "  [2/2] "
if [ -d "~/.config/home-manager/home-configs" ]; then
    echo "why you start instalation?"
else
    rm -rf ~/.config/home-manager/* > /dev/null 2>&1
    cd ~/.config/home-manager > /dev/null 2>&1
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
