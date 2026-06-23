{ pkgs, ... }:

{
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
}
