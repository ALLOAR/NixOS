{ config, pkgs, ... }:
{
  # Основная видеокарта - AMD (amdgpu), NVIDIA работает через PRIME
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];
  hardware.opengl.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.enable = true;
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      intelBusId = "PCI:5:0:0";  # Укажи здесь AMD GPU (найденное в lspci)
      nvidiaBusId = "PCI:1:0:0"; # Укажи здесь NVIDIA GPU
    };
  };

  # Не отключаем AMD, чтобы NVIDIA работала корректно
  boot.blacklistedKernelModules = [ "nouveau" ];

  # Оптимизация энергопотребления NVIDIA
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{power/control}="auto"
  '';
}
