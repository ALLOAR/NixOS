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
  mkdir -p /home/alloar/nixos
  mkdir -p /home/alloar/sich_amussieren
  mkdir -p /home/allaor/test
}
git() {
  git config --global user.name "ALLOAR"
  git config --global user.email "evgenzbiranik@gmail.com"
  cd /home/alloar/.config/home-manager
  sudo ssh-keygen -t ed25519 -C "evgenzbiranik@gmail.com"
  ssh-keygen -t ed25519 -C "evgenzbiranik@gmail.com"
  git init
  git remote add origin git@github.com:ALLOAR/NixOS.git
  cd /home/alloar/sich_amussieren
  git init
  git remote add origin git@github.com:ALLOAR/NixOS.git
  cd /home/alloar/nixos
  git remote add origin git@github.com:ALLOAR/NixOS.git
  git init
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
  #mv hyprland.conf ~/.config/hypr/
}
download_nixos() {
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configuration.nix -o $HOME/configuration.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/programs.nix -o $HOME/programs.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/amd.nix -o $HOME/amd.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia.nix -o $HOME/nvidia.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/nvidia_prime.nix -o $HOME/nvidia_prime.nix
}
download_home() {
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home.nix -o $HOME/home.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home-configs/alacritty.nix -o $HOME/alacritty.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home-configs/zsh.nix -o $HOME/zsh.nix
}
hyprland() {
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/hyprland.conf -o $HOME/hyprland.conf
cd
mkdir -p ~/.config/hypr/
cp hyprland.conf ~/.config/hypr/
}
bspwm() {
cd
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/bspwmrc -o $HOME/bspwmrc
curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/sxhkdrc -o $HOME/sxhkdrc
mkdir -p ~/.config/sxhkd/
mkdir -p ~/.config/bspwm/
mv sxhkd ~/.config/sxhkd/
mv bspwmrc ~/.config/bspwm/
}
clean_system() {
sudo rm -rf /home/alloar/*
sudo rm -rf /etc/nixos/*
}
clean_system
download_nixos
download_home
create_directories
mv_nixos_files
mv_home_files

echo " ==== what display manager you want - bspwm/hyprland === "
read -p " 1/2 - " manager


if [ "$manager" == 1 ]; then
  bspwm
  "after instalation change one line in the configuration.nix"
elif [ "$manager" == 2]; then
  hyprland

read -p "Пересобрать сразу же систему? yes/no (fingertype) " choise

if [ "$choise" == "yes" ]; then
    sudo nixos-rebuild switch
    home-manager switch
    git
else
    echo "Тогда делай все руками долбоеб"
fi
echo "if you want change win_manager to hyprland/bspwm after instalation"
echo "bspwm"
