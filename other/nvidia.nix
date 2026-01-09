{ config, lib, pkgs, ... }: {
  # Включаем драйвера для NVIDIA
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable32Bit = true;

  # Включаем OpenGL
  hardware.graphics.enable = true;
  # Настройки для NVIDIA
  hardware.nvidia = {
    modesetting.enable = true;        # Включаем режимы работы NVIDIA
    open = false;                     # Используем проприетарные драйвера NVIDIA
    nvidiaSettings = true;            # Включаем поддержку настройки через nvidia-settings
    package = config.boot.kernelPackages.nvidiaPackages.stable; # Используем стабильный пакет NVIDIA
    powerManagement.enable = true;    # Включаем управление энергопотреблением
  };

  # Отключаем Nouveau (открытый драйвер NVIDIA)
  boot.blacklistedKernelModules = [ "nouveau" ];

  # Оптимизация энергопотребления NVIDIA
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{power/control}="auto"
  '';
}
