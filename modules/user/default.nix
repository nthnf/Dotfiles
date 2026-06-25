{ inputs, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "26.05";

  programs = {
    btop.enable = true;
    fastfetch.enable = true;
    yazi.enable = true;
    fuzzel.enable = true;
    eza.enable = true;

    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };

  home.packages = with pkgs; [
    dust
    inputs.devenv.packages.${pkgs.stdenv.hostPlatform.system}.devenv
  ];

  imports = [
    ./terminal.nix
    ./starship.nix
    ./git.nix
    ./helix.nix
    ./niri.nix
    ./noctalia.nix
    ./sh.nix
    ./tmux.nix
    ./direnv.nix
  ];
}
