#!/bin/bash
set -e

DISK="/dev/sda"  # ❗ Измени только это

echo "[1/5] Разметка $DISK..."
parted $DISK -- mklabel gpt
parted $DISK -- mkpart ESP fat32 1MiB 512MiB
parted $DISK -- set 1 boot on
parted $DISK -- mkpart primary ext4 512MiB 100%

mkfs.fat -F32 -n boot ${DISK}1
mkfs.ext4 -L nixos ${DISK}2

echo "[2/5] Монтирование..."
sudo mkdir -p /mnt
mount ${DISK}2 /mnt
mkdir -p /mnt/boot
mount ${DISK}1 /mnt/boot
echo "[3/5] Копирование конфигов..."
cd
sudo nixos-generate-config --root /mnt
mkdir -p /mnt/etc/nixos/configurations
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configuration.nix -o /mnt/etc/nixos/configuration.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/programs.nix -o /mnt/etc/nixos/configurations/programs.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/amd.nix -o /mnt/etc/nixos/configurations/amd.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia.nix -o /mnt/etc/nixos/configurations/nvidia.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia_prime.nix -o /mnt/etc/nixos/configurations/nvidia_prime.nix

cd /mnt/etc/nixos/
cp hardware-configuration.nix ~/
sudo mv hardware-configuration.nix configurations
cd

echo "[4/4] Установка..."



