{ config, pkgs, ... }:

let
  mod = "Alt";
in
{
  xdg.configFile."niri/config.kdl".text = ''
    spawn-at-startup "noctalia"

    binds {
      ${mod}+T { spawn "ghostty"; }
      ${mod}+B { spawn "brave"; }
      ${mod}+Space { spawn "fuzzle"; }
      ${mod}+F { spawn "ghostty" "-e" "yazi"; }
      ${mod}+Q { close-window; }
    }
  '';

}
