#!/bin/bash
set -e

DISK="/dev/sda"  # ❗ Измени только это

echo "[1/5] Разметка $DISK..."
parted $DISK -- mklabel gpt
parted $DISK -- mkpart ESP fat32 1MiB 1500MiB
parted $DISK -- set 1 boot on
parted $DISK -- mkpart primary ext4 1500MiB 100%

mkfs.fat -F32 -n boot ${DISK}1
mkfs.ext4 -L nixos ${DISK}2

echo "[2/5] Монтирование..."
mount ${DISK}2 /mnt
mkdir -p /mnt/boot
mount ${DISK}1 /mnt/boot

echo "[3/5] Копирование конфигов..."

cd
sudo mv /mnt/etc/nixos/hardware-configuration.nix /etc/nixos/configurations/
sudo mv programs.nix /mnt/etc/nixos/configurations/
sudo mv configuration.nix /mnt/etc/nixos/
sudo mv amd.nix /mnt/etc/nixos/configurations/
sudo mv nvidia.nix /mnt/etc/nixos/configurations/
sudo mv nvidia_prime.nix /mnt/etc/nixos/configurations/

curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configuration.nix -o $HOME/configuration.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/programs.nix -o $HOME/programs.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/amd.nix -o $HOME/amd.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia.nix -o $HOME/nvidia.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia_prime.nix -o $HOME/nvidia_prime.nix

sudo nixos-generate-config --root /mnt

cd /mnt/etc/nixos
sudo mkdir -p configurations


sudo mv hardware-configuration.nix configurations
cd

sudo mv programs.nix /mnt/etc/nixos/configurations/
sudo mv configuration.nix /mnt/etc/nixos/
sudo mv amd.nix /mnt/etc/nixos/configurations/
sudo mv nvidia.nix /mnt/etc/nixos/configurations/
sudo mv nvidia_prime.nix /mnt/etc/nixos/configurations/
echo "[4/5] Установка..."
nixos-install

echo "[5/5] Перезагрузка..."


