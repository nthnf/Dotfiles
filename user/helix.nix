{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nixd
      nixfmt
    ];

    settings = {
      theme = "tokyonight";

      editor = {
        bufferline = "multiple";

        text-width = 100;

        soft-wrap = {
          enable = true;
          wrap-at-text-width = true;
        };
      };

      keys.normal = {
        "H" = "goto_previous_buffer";
        "L" = "goto_next_buffer";
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
            args = [ "-" ];
          };
        }
      ];
    };
  };
}
