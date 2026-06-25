{ inputs, pkgs, ... }:

{
  programs.niri.settings = {
    spawn-at-startup = [
      { command = [ "noctalia" ]; }
    ];

    layout = {
      default-column-width = {
        proportion = 1.0;
      };
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
      "Mod+Return".action.spawn = [ "brave" ];
      "Mod+Space".action.spawn = [ "fuzzel" ];
      "Mod+F".action.maximize-column = [ ];
      "Mod+Shift+F".action.spawn = [ "nautilus" ];
      "Mod+Q".action.close-window = [ ];
    };
  };
}
