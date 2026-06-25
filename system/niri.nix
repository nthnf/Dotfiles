{ pkgs, ... }:

{
  programs.niri.enable = true;
  programs.niri.useNautilus = true;

  programs.xwayland.enable = true;
}
