{ lib, ... }:

{
  imports = [
    ../../../common/cpu/amd
    ../../../common/cpu/amd/pstate.nix
    ../../../common/gpu/amd
    ../../../common/gpu/nvidia/prime.nix
    ../../../common/gpu/nvidia/turing
    ../../../common/pc/laptop
    ../../../common/pc/ssd
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
      amdgpuBusId = "PCI:05:0:0";
      nvidiaBusId = "PCI:01:0:0";
    };
  };
}
