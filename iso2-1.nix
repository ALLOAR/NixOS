{ config, pkgs, ... }:

{
  isoImage.isoName = "custom-nixos.iso";

  environment.systemPackages = with pkgs; [
    nano
    neofetch
    parted       # Для разметки диска (mklabel, mkpart)
    gptfdisk     # Дополнительные инструменты GPT (gdisk, sgdisk)
    util-linux   # fdisk, sfdisk, mkfs и другие базовые утилиты
    e2fsprogs    # mkfs.ext4, resize2fs и другие инструменты ext4
    dosfstools
    curl
    wget
    git
  ];

  # Добавим install.sh в /install.sh
  #environment.etc."install.sh".source = ./install.sh;
  environment.etc = {
    "install.sh" = {
      source = ./install.sh;
      mode = "0755";  # Делаем исполняемым
    };
  };
  # Копируем из /etc/install.sh в / при загрузке
  system.activationScripts.installScript = {
    text = ''
      cp /etc/install.sh /install.sh
      chmod +x /install.sh
    '';
  };

  # Автоматический вход для пользователя nixos
  services.getty.autologinUser = "nixos";

  # Создаем пользователя nixos с пустым паролем
  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Даем права sudo
    password = "1"; # Пустой пароль
  };

  # Также разрешаем вход root с пустым паролем
  users.users.root.password = "";
}
