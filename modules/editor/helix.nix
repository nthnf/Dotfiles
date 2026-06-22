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
      # editor = {
      # 	"line-number" = "relative";
      # 	"cursor-shape" = {
      # 		insert = "bar";
      # 		shape = "block";
      # 		select = "underline";
      # 	};
      # };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
            args =["-"];
          };
        }
      ];
    };
  };
}
