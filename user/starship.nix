{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      # Notice how much cleaner the format string is! 
      # Added $nix_shell right before the time block.
      format = "[](red)$os$username[](bg:peach fg:red)$directory[](bg:yellow fg:peach)$git_branch$git_status[](fg:yellow bg:green)$c$rust$python$nodejs$nix_shell[](fg:green bg:sapphire)$time[ ](fg:sapphire)$cmd_duration$character";

      palette = "catppuccin_mocha";

      # Only the NixOS logo!
      os = {
        disabled = false;
        style = "bg:red fg:crust";
        symbols = {
          NixOS = " ";
        };
      };

      # The Nix "Lang" logo that appears when you use direnv / nix-shell
      nix_shell = {
        symbol = " ";
        format = "[[ $symbol( $state) ](fg:crust bg:green)]($style)";
      };

      username = {
        show_always = true;
        style_user = "bg:red fg:crust";
        style_root = "bg:red fg:crust";
        format = "[ $user ]($style)";
      };

      directory = {
        style = "bg:peach fg:crust";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      git_branch = {
        symbol = "";
        style = "bg:yellow";
        format = "[[ $symbol $branch ](fg:crust bg:yellow)]($style)";
      };

      git_status = {
        style = "bg:yellow";
        format = "[[($all_status$ahead_behind )](fg:crust bg:yellow)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:sapphire";
        format = "[[  $time ](fg:crust bg:sapphire)]($style)";
      };

      character = {
        disabled = false;
        success_symbol = "\n[❯](bold fg:green)";
        error_symbol = "\n[❯](bold fg:red)";
      };

      # Stripped-down Catppuccin palette to just the colors you are actually using
      palettes = {
        catppuccin_mocha = {
          red = "#f38ba8";
          peach = "#fab387";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          sapphire = "#74c7ec";
          crust = "#11111b";
        };
      };
    };
  };
}
