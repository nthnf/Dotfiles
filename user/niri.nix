{ config, pkgs, ... }:

let
  mod = "Mod";
in
{
  xdg.configFile."niri/config.kdl".text = ''
    spawn-at-startup "noctalia-shell"

    layout {
      default-column-width { proportion 1.0; }    
    };

    output "Virtual-1" {
      mode "2560x1440@60";

      scale 1.0;
    };

    binds {
      ${mod}+T { spawn "ghostty"; }
      ${mod}+B { spawn "brave"; }
      ${mod}+Space { spawn "fuzzel"; }
      ${mod}+F { maximize-column; }
      ${mod}+Shift+F { spawn "ghostty" "-e" "yazi"; }
      ${mod}+Q { close-window; }
    }
  '';

}
