{ inputs, pkgs, ... }:

{
  programs.niri.settings = {
      spawn-at-startup = [
        { command = [ "noctalia" ]; }
      ];

      layout = {
        default-column-width = { proportion = 1.0; };
      };

      outputs."Virtual-1" = {
        mode = {
          width = 2560;
          height = 1440;
        };
        scale = 1.5;
      };

      hotkey-overlay = {
        skip-at-startup = true;
      };

      binds = {
        "Mod+T".action.spawn = [ "ghostty" ];
        "Mod+B".action.spawn = [ "brave" ];
        "Mod+Space".action.spawn = [ "fuzzel" ];
        "Mod+F".action.maximize-column = [ ];
        "Mod+Shift+F".action.spawn = [ "ghostty" "-e" "yazi" ];
        "Mod+Q".action.close-window = [ ];
      };
    };
}
