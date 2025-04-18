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

echo "[4/5] Установка..."
nixos-install --no-root-passwd

echo "[5/5] Перезагрузка..."
sleep 5
reboot
