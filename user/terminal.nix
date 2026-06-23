{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      theme = "TokyoNight Storm";
      "window-decoration" = false;
      font-size = 12;
      "window-theme" = "ghostty";
    };
  };
}
