{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    baseIndex = 1;
    mouse = true;
    prefix = "C-Space";
    terminal = "screen-256color";
  };
}
