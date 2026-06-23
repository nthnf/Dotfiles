{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ./user
  ];

  home.stateVersion = "26.05";
}
