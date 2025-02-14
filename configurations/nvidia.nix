{ config, pkgs, ... }:

{
  # Включите проприетарные драйверы
  services.xserver.videoDrivers = [ "nvidia" "amdgpu" ];

  hardware = {
    opengl = {
      enable = true;
      #driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ 
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };

    nvidia = {
      modesetting.enable = true;  # Критично для Wayland!
      powerManagement.enable = true;
      open = false;  # Использовать проприетарный драйвер
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      
      # Для динамического переключения (Prime)
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        amdgpuBusId = "PCI:5:0:0";  # lspci | grep VGA
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
