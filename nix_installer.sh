#!/run/current-system/sw/bin/bash
echo "start install you system"
start() {
	echo "what configuration you want"
}

create_directories() {
  cd
  sudo mkdir -p /etc/nixos/connfigurations
  sudo mkdir -p /home/alloar/.config
  sudo mkdir -p /home/alloar/home-manager
  sudo mkdir -p /home/alloar/home-manager/home_configs
  sudo mkdir -p /home/alloar/hypr
}

mv_min_nixos_files() {
  cd
  sudo mv /etc/nixos/hardware-configuration.nix /etc/nixos/configurations/
  sudo mv programs.nix /etc/nixos/configurations/
  sudo mv configuration.nix /etc/nixos/
  sudo mv auto-delate.nix /etc/nixos/configurations/
  sudo mv keyboard.nix /etc/nixos/configurations/
  sudo mv bluetooth.nix /etc/nixos/configurations/
}

mv_max_nixos_files() {
  cd
  sudo mv /etc/nixos/hardware-configuration.nix /etc/nixos/configurations/
  sudo mv programs.nix /etc/nixos/configurations/
  sudo mv configuration.nix /etc/nixos/
  sudo mv auto-delate.nix /etc/nixos/configurations/
  sudo mv keyboard.nix /etc/nixos/configurations/
  sudo mv bluetooth.nix /etc/nixos/configurations/
  sudo mv laptop.nix /etc/nixos/configurations/
  sudo mv other_gpu_drivers.nix /etc/nixos/configurations/
}
mv_home_files() {
  cd
  sudo mv home.nix ~/.config/home-manager/
  sudo mv alacritty.nix ~/.config/home-manager/home_configs/
  sudo mv zsh.nix ~/.config/home-manager/home_configs/
  sudo mv waybar.nix ~/.config/home-manager/home_configs/
  sudo mv hyprland.nix ~/.config/hypr/
  sudo mv programs_home.nix ~/.config/hypr/
}
installer_select() {
start
read -p "minimal - 1, full(with nvidia/amd/both drivers) - 2/3/4: " num
if [[ $num -eq 1 ]]; then
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configuration.nix -o $HOME/configuration.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/programs.nix -o $HOME/programs.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/auto-delate.nix -o $HOME/auto-delate.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/bluetooth.nix -o $HOME/bluetooth.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/idk.nix -o $HOME/idk.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/keyboard.nix -o $HOME/keyboard.nix
  #конфигурация homf-manager
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home.nix -o $HOME/home.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home_configs/alacritty.nix -o $HOME/alacritty.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home_configs/programs.nix -o $HOME/programs_home.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home_configs/waybar.nix -o $HOME/waybar.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home_configs/zsh.nix -o $HOME/zsh.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/hyprland.conf -o $HOME/hyprland.conf
  mv_min_nixos_files
  mv_home_files
elif [[ $num -eq 2 ]]; then
	echo $num

elif [[ $num -eq 3 ]]; then
	echo $num

elif [[ $num -eq 4 ]]; then
	echo "you choise is - " $num
	echo "you sure? yes/no"
	read choise
	if [[ choise != "yes" ]]; then
		echo "you choise is no"
	elif [[ choise != no ]]; then
		echo "you choise is yes"
	fi
	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configuration.nix -o $HOME/configuration.nix
 	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/programs.nix -o $HOME/programs.nix
	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/auto-delate.nix -o $HOME/auto-delate.nix
	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/bluetooth.nix -o $HOME/bluetooth.nix
	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/idk.nix -o $HOME/idk.nix
	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/keyboard.nix -o $HOME/keyboard.nix
	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/laptop.nix -o $HOME/laptop.nix
	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/other_gpu_drivers.nix -o $HOME/other_gpu_drivers.nix
	  #конфигурация home-manager
	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home.nix -o $HOME/home.nix
	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home_configs/alacritty.nix -o $HOME/alacritty.nix
	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home_configs/programs.nix -o $HOME/programs_home.nix
	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home_configs/waybar.nix -o $HOME/waybar.nix
	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/home_configs/zsh.nix -o $HOME/zsh.nix
	  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/home/hyprland.conf -o $HOME/hyprland.conf
	  mv_max_nixos_files
	  mv_home_files

else
	echo "failed to select option, please select other option"
fi
}
installer_select
