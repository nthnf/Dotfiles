{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ./modules/editor
    ./modules/tools
    ./modules/dev
    ./modules/config
  ];

  home.packages = with pkgs; [
    btop
  ];

  home.stateVersion = "26.05";
}
