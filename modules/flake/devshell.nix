{ inputs, ... }: {
  imports = [
    inputs.devenv.flakeModule
  ];

  perSystem = { config, self', inputs', pkgs, system, ... }: {
    devenv.shells.default = {
      # Installs tools inside the dev shell environment
      packages = with pkgs; [
        git
        nil              # Nix Language Server (nil)
        nixd             # Nix Language Server (nixd)
        nixfmt-rfc-style # Nix formatter
      ];

      # Optional startup scripts
      enterShell = ''
        echo "Welcome to your Dotfiles development environment!"
        echo "Nix LSPs (nil, nixd) and formatter (nixfmt) are available."
      '';
    };
  };
}
