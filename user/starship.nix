{ pkgs, config, ... }:

let
  c = config.lib.stylix.colors.withHashtag;
in
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      # Notice how much cleaner the format string is!
      # Added $nix_shell right before the time block.
      format = "[](${c.base08})$os$username[](bg:${c.base09} fg:${c.base08})$directory[](bg:${c.base0A} fg:${c.base09})$git_branch$git_status[](fg:${c.base0A} bg:${c.base0B})$c$rust$python$nodejs$nix_shell[](fg:${c.base0B} bg:${c.base0D})$time[ ](fg:${c.base0D})$cmd_duration$character";

      # Only the NixOS logo!
      os = {
        disabled = false;
        style = "bg:${c.base08} fg:${c.base00}";
        symbols = {
          NixOS = " ";
        };
      };

      # The Nix "Lang" logo that appears when you use direnv / nix-shell
      nix_shell = {
        symbol = " ";
        format = "[[ $symbol( $state) ](fg:${c.base00} bg:${c.base0B})]($style)";
      };

      username = {
        show_always = true;
        style_user = "bg:${c.base08} fg:${c.base00}";
        style_root = "bg:${c.base08} fg:${c.base00}";
        format = "[ $user ]($style)";
      };

      directory = {
        style = "bg:${c.base09} fg:${c.base00}";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      git_branch = {
        symbol = "";
        style = "bg:${c.base0A}";
        format = "[[ $symbol $branch ](fg:${c.base00} bg:${c.base0A})]($style)";
      };

      git_status = {
        style = "bg:${c.base0A}";
        format = "[[($all_status$ahead_behind )](fg:${c.base00} bg:${c.base0A})]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:${c.base0D}";
        format = "[[  $time ](fg:${c.base00} bg:${c.base0D})]($style)";
      };

      character = {
        disabled = false;
        success_symbol = "\n[❯](bold fg:${c.base0B})";
        error_symbol = "\n[❯](bold fg:${c.base08})";
      };
    };
  };
}
