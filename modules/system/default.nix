{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    wget
    vim
    curl
    wl-clipboard
    ghostty
    noctalia-shell
  ];

  imports = [
    ./niri.nix
    ./graphics.nix
    ./audio.nix
  ];

  # SSH service
  services.openssh.enable = true;
}
