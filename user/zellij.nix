{ config, pkgs, ... }:

{

  programs.zellij = {
    enable = true;
    settings = {
      default_layout = "simple";
      pane_frames = false;
      show_startup_tips = false;
    };
  };

  xdg.configFile."zellij/layouts/simple.kdl".text = ''
    layout {
        default_tab_template {
            pane size=1 borderless=true {
                plugin location="https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm" {
                    format_left  "{mode}#[fg=#${config.lib.stylix.colors.base0A},bold] Nix {tabs}"
                    format_right "{command_kubectx}#[fg=#${config.lib.stylix.colors.base03}]::{command_kubens}{datetime}"
                    format_space ""

                    mode_normal          "#[fg=#${config.lib.stylix.colors.base00},bg=#${config.lib.stylix.colors.base0D},bold] NORMAL "
                    mode_tmux            "#[fg=#${config.lib.stylix.colors.base00},bg=#${config.lib.stylix.colors.base09},bold] TMUX "
                    mode_default_to_mode "tmux"

                    tab_normal               "#[fg=#${config.lib.stylix.colors.base03}] {index} {fullscreen_indicator}{sync_indicator}{floating_indicator}"
                    tab_active               "#[fg=#${config.lib.stylix.colors.base0D},bold] {index} {fullscreen_indicator}{sync_indicator}{floating_indicator}"
                    tab_fullscreen_indicator "□ "
                    tab_sync_indicator       "  "
                    tab_floating_indicator   "󰉈 "

                    command_kubectx_command  "kubectx -c"
                    command_kubectx_format   "#[fg=#${config.lib.stylix.colors.base04},italic] {stdout}"
                    command_kubectx_interval "2"

                    command_kubens_command  "kubens -c"
                    command_kubens_format   "#[fg=#${config.lib.stylix.colors.base04}]{stdout} "
                    command_kubens_interval "2"

                    datetime          "#[fg=#${config.lib.stylix.colors.base05}] {format} "
                    datetime_format   "%A, %d %b %Y %H:%M"
                    datetime_timezone "Asia/Jakarta"
                }
            }
            children
        }
    }
  '';
}
