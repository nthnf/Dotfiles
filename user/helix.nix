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
