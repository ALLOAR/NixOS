#!/bin/bash
set -e

DISK="/dev/sda"  # ❗ Измени только это

echo "you realy want erase this disk?"

read -p "$DISK" p

rm -rf ~/*

echo "[1/5] Разметка $DISK..."
parted $DISK -- mklabel gpt
parted $DISK -- mkpart ESP fat32 1MiB 1500MiB
parted $DISK -- set 1 boot on
parted $DISK -- mkpart primary ext4 1500MiB 100%

mkfs.fat -F32 -n boot ${DISK}1
mkfs.ext4 -L nixos ${DISK}2

echo "[2/5] Монтирование..."

sudo mkdir -p /mnt

mount ${DISK}2 /mnt
mkdir -p /mnt/boot
mount ${DISK}1 /mnt/boot

echo "[3/5] Копирование конфигов..."

cd

cp /etc/configuration.nix ~/
cp -r /etc/configurations/ ~/

sudo nixos-generate-config --root /mnt

#curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configuration.nix -o $HOME/configuration.nix
#curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/programs.nix -o $HOME/programs.nix
#curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/amd.nix -o $HOME/amd.nix
#curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia.nix -o $HOME/nvidia.nix
#curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia_prime.nix -o $HOME/nvidia_prime.nix


cd /mnt/etc/nixos
sudo mkdir -p configurations
cd


sudo mv configuration.nix /mnt/etc/nixos/
sudo mv configurations /mnt/etc/nixos
#sudo mv ./configurations/programs.nix /mnt/etc/nixos/configurations/
#sudo mv ./configurations/amd.nix /mnt/etc/nixos/configurations/
#sudo mv ./configurations/nvidia.nix /mnt/etc/nixos/configurations/
#sudo mv ./configurations/nvidia_prime.nix /mnt/etc/nixos/configurations/


cd /mnt/etc/nixos/
cp hardware-configuration.nix ~/
sudo mv hardware-configuration.nix configurations
cd

nix-channel --add https://nixos.org/channels/nixos-24.11 nixos nix-channel --update

echo "[4/4] Установка..."



