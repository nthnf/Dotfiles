{ pkgs, ... }:

{
  programs.lutris = {
    enable = true;
    steamPackage = pkgs.steam;
    extraPackages = with pkgs; [
      mangohud
      winetricks
      gamescope
      gamemode
      umu-launcher
    ];
    protonPackages = with pkgs; [
      proton-ge-bin
    ];
    winePackages = with pkgs; [
      wineWow64Packages.waylandFull
    ];
  };
}
