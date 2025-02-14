{ config, pkgs, ... }:

{
  # Ядро и параметры загрузки
  boot = {
    #kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
	"nouveau.modeset-0"
	"nvidia_drm.modeset=1"
	"nvidia.NVreg_RegistryDwords=OverrideMaxPerf=0x1"
	"nvidia_drm.fbdev=1"          # Фикс для некоторых Wayland-композиторов
    ];
  };

  # Графическая подсистема
  hardware = {
    opengl = {
      enable = true;
      #driSupport = true;            # Раскомментируй для DRI3
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
        vulkan-validation-layers    # Для отладки Vulkan
        libglvnd                    # Важно для GLX
      ];
    };

    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;         # Для ноутбуков с Turing+
      };
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        amdgpuBusId = "PCI:5:0:0";  # Проверь через lspci -nn
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  # Переменные окружения
  environment = {
    variables = {
      #VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.json";
      GBM_BACKEND = "nvidia-drm";   # Критично для Wayland
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";# Фикс курсора в Hyprland
    };

    systemPackages = with pkgs; [
      vulkan-tools                  # Для vkvia и vulkaninfo
      nvtop                         # Мониторинг GPU
    ];
  };

  # Для Hyprland
  #programs.hyprland = {
    #enable = true;
    #enableNvidiaPatches = true;     # Специфичные патчи для NVIDIA
    #xwayland.enable = true;
  #};

  # Фикс для Steam
  systemd.tmpfiles.rules = [
    "L+ /home/ваш_пользователь/.local/share/vulkan/icd.d/nvidia_icd.json - - - - /run/opengl-driver/share/vulkan/icd.d/nvidia_icd.json"
  ];
}
