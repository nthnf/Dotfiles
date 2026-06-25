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
    ripgrep.enable = true;
    fd.enable = true;
    fzf.enable = true;
    bat.enable = true;
    jq.enable = true;
    
    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };

  home.packages = with pkgs; [
    dust
    inputs.devenv.packages.${pkgs.stdenv.hostPlatform.system}.devenv
    mpv-shim-default-shaders
    qbittorrent
    lsfg-vk
    lsfg-vk-ui
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
    ./lazygit.nix
    ./lutris.nix
    ./mpv.nix
  ];
}
