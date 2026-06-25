{ inputs, ... }: {
  flake.nixosConfigurations.nfx = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      # Host-specific hardware and configuration
      ../hosts/nfx/configuration.nix

      # Home Manager Integration
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.nthnf = import ../user/default.nix;
        home-manager.extraSpecialArgs = { inherit inputs; };
      }

      # Stylix Styling Engine
      inputs.stylix.nixosModules.stylix

      # Official Niri NixOS Module
      inputs.niri.nixosModules.niri
    ];
  };
}
