{ pkgs, ... }:

let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
  };
in
{
  environment.systemPackages = [ sddm-astronaut ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    extraPackages = with pkgs; [
      kdePackages.qtmultimedia
    ];
    theme = "sddm-astronaut-theme";
  };
}
