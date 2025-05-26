#!/bin/bash
set -e

echo "[1/5] Разметка $DISK..."
DISK="/dev/sda"  # ❗ Измени только это

echo "[1/5] Разметка $DISK..."
# Создание таблицы разделов GPT
parted $DISK -- mklabel gpt
# EFI-раздел (ESP)
parted $DISK -- mkpart ESP fat32 1MiB 512MiB
parted $DISK -- set 1 boot on
# Swap-раздел — 8 ГБ
parted $DISK -- mkpart primary linux-swap 512MiB 8704MiB
# Основной раздел ext4
parted $DISK -- mkpart primary ext4 8704MiB 100%
echo "[2/5] Форматирование разделов..."
# Форматирование EFI
mkfs.fat -F32 -n boot ${DISK}1
# Форматирование swap
mkswap -L swap ${DISK}2
# Форматирование ext4
mkfs.ext4 -L nixos ${DISK}3
echo "[3/5] Активация swap..."
swapon ${DISK}2

echo "[3.5/5] Монтирование разделов..."
mount ${DISK}3 /mnt
mkdir -p /mnt/boot
mount ${DISK}1 /mnt/boot


echo "[4/5] Копирование конфигов..."
cd
sudo nixos-generate-config --root /mnt
mkdir -p /mnt/etc/nixos/configurations
git clone --branch main --single-branch https://github.com/ALLOAR/NixOS
cd NixOS
cp -r * /mnt/etc/nixos/
cp /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/configurations/
cd
nix-channel --add https://nixos.org/channels/nixos-24.11 nixos nix-channel --update
sudo nano /mnt/etc/nixos/configuration.nix
echo "[5/5] Установка..."


