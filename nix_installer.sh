#!/run/current-system/sw/bin/bash
echo "start install you system"

confirm_roots() {
sudo chown -R $USER:$wheel /etc/nixos
sudo chown -R $USER:$wheel /home/alloar
}

create_directories() {
  cd
  sudo mkdir -p /etc/nixos/configurations
  mkdir -p /home/alloar/.config
  mkdir -p /home/alloar/.config/home-manager
  mkdir -p /home/alloar/.config/home-manager/home-configs
  mkdir -p /home/alloar/.config/hypr
}

mv_nixos_files() {
  cd
  sudo mv /etc/nixos/hardware-configuration.nix /etc/nixos/configurations/
  sudo mv programs.nix /etc/nixos/configurations/
  sudo mv configuration.nix /etc/nixos/
  sudo mv amd.nix /etc/nixos/configurations/
  sudo mv nvidia.nix /etc/nixos/configurations/
  sudo mv nvidia_prime.nix /etc/nixos/configurations/
}
mv_home_files() {
  cd
  mv home.nix ~/.config/home-manager/
  mv alacritty.nix ~/.config/home-manager/home-configs/
  mv zsh.nix ~/.config/home-manager/home-configs/
  mv hyprland.conf ~/.config/hypr/
}
download_nixos() {
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configuration.nix -o $HOME/configuration.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/programs.nix -o $HOME/programs.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/auto-delate.nix -o $HOME/auto-delate.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/bluetooth.nix -o $HOME/bluetooth.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/amd.nix -o $HOME/amd.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia.nix -o $HOME/nvidia.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia_prime.nix -o $HOME/nvidia_prime.nix
}
download_home() { 
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home.nix -o $HOME/home.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home-configs/alacritty.nix -o $HOME/alacritty.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home-configs/zsh.nix -o $HOME/zsh.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/hyprland.conf -o $HOME/hyprland.conf
}
clean_system() {
sudo rm -rf /home/alloar/*
}
download_nixos
download_home
create_directories
mv_nixos_files
mv_home_files
