{ config, pkgs, ... }:
{
  # Подключаем драйверы AMD
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    mesa
    mesa.drivers
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
  ];

  # Отключаем дискретную NVIDIA-карту
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{device}=="*", ATTR{power/control}="auto"
  '';

  boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

  # Опционально: отключение PCI-устройства через ACPI (может потребоваться в некоторых случаях)
  boot.kernelParams = [ "module_blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm" ];
}
