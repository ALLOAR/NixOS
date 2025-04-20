#!/bin/bash
set -e
cd
echo "  [1/2] "
if [ -d "/etc/nixos/configurations" ]; then
    echo "Директория configurations существует"
    echo "Установка Конфигураций не нужна"
else
    mkdir -p /etc/nixos/configurations
    curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configuration.nix -o /mnt/etc/nixos/configurations/configuration.nix
    curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/programs.nix -o /mnt/etc/nixos/configurations/programs.nix
    curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/amd.nix -o /mnt/etc/nixos/configurations/amd.nix
    curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia.nix -o /mnt/etc/nixos/configurations/nvidia.nix
    curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia_prime.nix -o /mnt/etc/nixos/configurations/nvidia_prime.nix
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
    rm -rf ~/.config/home-manager/*
    cd ~/.config/home-manager
    git clone --branch home --single-branch https://github.com/ALLOAR/NixOS
    cd NixOS
    cp -r * ~/.config/home-manager
    cd ~/.config/home-manager
    rm -rf NixOS
fi

