{ config, pkgs, ... }:

{
  isoImage.isoName = "custom-nixos.iso";

  environment.systemPackages = with pkgs; [
    nano
    neofetch
  ];

  # Добавим install.sh в /install.sh
  environment.etc."install.sh".source = ./install.sh;

  # Копируем из /etc/install.sh в / при загрузке
  system.activationScripts.installScript = {
    text = ''
      cp /etc/install.sh /install.sh
      chmod +x /install.sh
    '';
  };

  #services.getty.autoLogin.enable = true;
  #services.getty.autoLogin.user = "nixos";

  #users.users.nixos = {
  #  isNormalUser = true;
  #  extraGroups = [ "wheel" ];
  #  password = "";
  #};

  #users.users.root.initialHashedPassword = "";

  #systemd.defaultTarget = "multi-user.target";
}
