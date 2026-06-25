{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nil
      nixd
      nixfmt
    ];

    settings = {
      editor = {
        bufferline = "multiple";

        text-width = 120;

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

  };
}
