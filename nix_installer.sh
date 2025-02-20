#!/run/current-system/sw/bin/bash

echo "start install you system"
start() {
	echo "what configuration you want"
}
installer_select() {
read -p "minimal - 1, full(with nvidia/amd/both drivers) - 2/3/4, "num
if [ $num == 1 ]; then
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configuration.nix -o $HOME/configuration.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/programs.nix -o $HOME/programs.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/auto-delate.nix -o $HOME/auto-delate.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/bluetooth.nix -o $HOME/bluetooth.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/programs.nix -o $HOME/idk.nix
  curl https://raw.githubusercontent.com/ALLOAR/NixOS/refs/heads/main/configurations/keyboard.nix -o $HOME/keyboard.nix
elif [ $num == 2 ]; then


elif [ $num == 3 ]; then


elif [ $num == 4 ]; then


else 
	echo "failed to select option, please select other option"
fi
}
if [ $mun != 1 && $num != 2 && $num != 3 && $num != 4 ]; then
	installer_select
fi

