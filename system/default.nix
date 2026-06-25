{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    wget
    vim
    curl
    zsh
    wl-clipboard
    ghostty
    noctalia-shell
    brave
  ];

  imports = [
    ./niri.nix
    ./graphics.nix
    ./audio.nix
  ];

  # SSH service
  services.openssh.enable = true;

  # Host & Guest Clipboard
  services.spice-vdagentd.enable = true;

  # Tell VM 2k Render
  boot.kernelParams = [ "video=Virtual-1:2560x1440" ];
}
