#!/bin/bash
set -e

echo "[1/5] Разметка $DISK..."
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/iso/disko.nix -o ~/disko.nix
cd
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./disko.nix

echo "[3/5] Копирование конфигов..."
cd
sudo nixos-generate-config --root /mnt
mkdir -p /mnt/etc/nixos/configurations
cp /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/configurations/
git clone --branch main --single-branch https://github.com/ALLOAR/NixOS
cd NixOS
cp -r * /mnt/etc/nixos/
cd
nix-channel --add https://nixos.org/channels/nixos-24.11 nixos nix-channel --update
sudo nano /mnt/etc/nixos/configurations.nix
echo "[4/4] Установка..."


