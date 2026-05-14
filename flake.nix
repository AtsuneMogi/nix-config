{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager, ... }:
  let
    # Helper function for Darwin (macOS) configurations
    mkDarwinConfig = { system, hostPath, username, homeDirectory }:
      darwin.lib.darwinSystem {
        inherit system;
        modules = [
          "${hostPath}/darwin-configuration.nix"

          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = { pkgs, ... }: {
              imports = [ "${hostPath}/home.nix" ];
              home.homeDirectory = pkgs.lib.mkForce homeDirectory;
              home.username = pkgs.lib.mkForce username;
            };
          }
        ];
      };

    # Helper function for Debian/Linux configurations (Home Manager only)
    mkLinuxConfig = { system, hostPath, username, homeDirectory }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          "${hostPath}/home.nix"
          {
            home.username = username;
            home.homeDirectory = homeDirectory;
          }
        ];
      };
  in {
    # ============================================================
    # macOS (Darwin) Configurations
    # ============================================================
    darwinConfigurations.m1-macbook-air = mkDarwinConfig {
      system = "aarch64-darwin";
      hostPath = ./hosts/m1-macbook-air;
      username = "atsune";
      homeDirectory = "/Users/atsune";
    };

    darwinConfigurations.m5-macbook-air = mkDarwinConfig {
      system = "aarch64-darwin";
      hostPath = ./hosts/m5-macbook-air;
      username = "atsune";
      homeDirectory = "/Users/atsune";
    };

    # ============================================================
    # Debian/Linux Configurations (Home Manager only)
    # ============================================================
    homeConfigurations.beaglebone-green = mkLinuxConfig {
      system = "armv7l-linux";
      hostPath = ./hosts/beaglebone-green;
      username = "debian";
      homeDirectory = "/home/debian";
    };
  };
}
