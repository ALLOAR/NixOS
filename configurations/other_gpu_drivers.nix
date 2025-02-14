{ config, pkgs, ... }: {
  
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
      vulkan-validation-layers
      vulkan-utility-libraries
    ];
  };
  boot.kernelParams = [
  "nvidia_drm.modeset=1"
  "nvidia.NVreg_RegistryDwords=OverrideMaxPerf=0x1"
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
