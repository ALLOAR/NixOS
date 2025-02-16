#!/run/current-system/sw/bin/bash
 

curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configuration.nix -o $HOME/configuration.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/programs.nix -o $HOME/programs.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/auto-delate.nix -o $HOME/auto-delate.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/bluetooth.nix -o $HOME/bluetooth.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/programs.nix -o $HOME/idk.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/keyboard.nix -o $HOME/keyboard.nix

curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home.nix -o $HOME/home.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home-configs/alacritty.nix -o $HOME/alacritty.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home_configs/programs.nix -o $HOME/programs.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home_configs/waybar.nix -o $HOME/waybar.nix
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home_configs/zsh.nix -o $HOME/zsh.nix

cd /home/alloar/

sudo mv configuration.nix /etc/nixos/
cd /etc/nixos/
sudo mkdir configurations
cd /home/alloar/
sudo mv programs.nix /etc/nixos/configurations/
sudo mv auto-delate.nix /etc/nixos/configurations/
sudo mv bluetooth.nix /etc/nixos/configurations/
sudo mv idk.nix /etc/nixos/configurations/
sudo mv keyboard.nix /etc/nixos/configurations/

mkdir -p .config
mkdir /home/alloar/.config/home-manager/
mv home.nix .config/home-manager/
mkdir /home/alloar/.config/home-maanger/home_configs
mv alacritty.nix .config/home-manager/home_configs/
mv programs.nix .config/home-manager/home_configs/
mv waybar.nix .config/home-manager/home_configs/
mv zsh.nix .config/home-manager/home_configs/
