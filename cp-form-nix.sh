#!/bin/bash

cp -r /etc/nixos/* ~/nixos/
# -r означает рекурсивно, то есть скопировать все директории и каталоги 
rm -rf ~/nixos/configurations/hardware-configurations.nix
