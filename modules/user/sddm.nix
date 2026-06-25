{ pkgs, ... }:

let
  sddm-astronaut = pkgs.sddm-sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
  };
in
{
  environment.systemPackages = [ sddm-astronaut ];
  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
  };
}
