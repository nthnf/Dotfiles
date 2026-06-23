{ pkgs, ... }:

{
  programs = {
    btop.enable = true;
    fastfetch.enable = true;
    yazi.enable = true;
    zellij.enable = true;
    fuzzel.enable = true;
    eza.enable = true;

    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };

  home.packages = with pkgs; [
    dust
  ];

  imports = [
    ./terminal.nix
    ./starship.nix
    ./git.nix
    ./helix.nix
    ./niri.nix
    ./sh.nix
  ];
}
