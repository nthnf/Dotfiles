{ pkgs, ... }:

{
  # boot.initrd.kernelModules = [ "amdgpu" ];
  # services.xserver.videoDriver = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
