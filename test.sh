#!bin/bash
set -e
DISK=$(gum choose /dev/sda /dev/nvme0n1 /dev/vda)
echo "Вы выбрали: $DISK"
echo "disk"
