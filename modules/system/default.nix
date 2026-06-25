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
    nautilus
    brave
    _7zip-zstd
    unrar
    peazip
  ];

  imports = [
    ./niri.nix
    ./graphics.nix
    ./audio.nix
    ./sddm.nix
    ./docker.nix
    ./steam.nix
  ];

  # SSH service
  services.openssh.enable = true;

  # Host & Guest Clipboard
  services.spice-vdagentd.enable = true;

  # Tell VM 2k Render
  boot.kernelParams = [ "video=Virtual-1:2560x1440" ];
}
