# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../system
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.limine = {
    enable = true;
    efiSupport = true;
    resolution = "1920x1080x32";

    style = {
      wallpapers = [ ];
      interface = {
        branding = "Nix Bootloader";
        # brandingColor = "bb9af7";
        resolution = "1280x720";
      };
      # backdrop = "1a1b26";
      # graphicalTerminal = {
      #   background = "1a1b26";
      #   foreground = "c0caf5";
      #   brightBackground = "24283b";
      #   brightForeground = "c0caf5";
      #   palette = "15161e;f7768e;9ece6a;e0af68;7aa2f7;bb9af7;7dcfff;a9b1d6";
      #   brightPalette = "414868;f7768e;9ece6a;e0af68;7aa2f7;bb9af7;7dcfff;c0caf5";
      # };
    };
  };

  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelParams = [
    "quiet"
    "splash"
  ];

  boot.plymouth = {
    enable = true;
    theme = "cuts_alt";
    themePackages = [
      (pkgs.adi1090x-plymouth-themes.override {
        selected_themes = [ "cuts_alt" ];
      })
    ];
  };

  networking.hostName = "nfx"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."nthnf" = {
    isNormalUser = true;
    description = "Nathan Farrel";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #    wget
  #    git
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  stylix = {
    enable = true;
    image = ../../assets/miku.png;

    targets.plymouth.enable = false;

    base16Scheme = {
      base00 = "1f1f28"; # Background (SumiInk1)
      base01 = "2a2a37"; # Lighter Background (SumiInk3)
      base02 = "223249"; # Selection Background (WaveBlue0)
      base03 = "727169"; # Comments / Dim (Funi)
      base04 = "7fb4ca"; # Subdued text (SpringBlue)
      base05 = "dcd7ba"; # Default text (FujiWhite)
      base06 = "c8c093"; # Highlights (FujiSand)
      base07 = "c8c093"; # Active text
      base08 = "c34043"; # Red (AutumnRed)
      base09 = "c0a36e"; # Goldish Orange (BoatYellow)
      base0A = "e6c384"; # Accent Gold (AutumnYellow)
      base0B = "76946a"; # Green (Shinonome)
      base0C = "6a9589"; # Aqua (WaveAqua)
      base0D = "7e9cd8"; # Blue (CrystalBlue)
      base0E = "957fb8"; # Purple (OniViolet)
      base0F = "938aa9"; # Sakura Pink
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };
  };
}
