{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager, ... }:
  {
    # ============================================================
    # macOS (Darwin) Configurations
    # ============================================================
    darwinConfigurations.m1-macbook-air = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/m1-macbook-air/darwin-configuration.nix

        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.atsune = { pkgs, ... }: {
            imports = [ ./hosts/m1-macbook-air/home.nix ];
            home.homeDirectory = pkgs.lib.mkForce "/Users/atsune";
            home.username = pkgs.lib.mkForce "atsune";
          };
        }
      ];
    };

    darwinConfigurations.m5-macbook-air = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/m5-macbook-air/darwin-configuration.nix

        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.atsune = { pkgs, ... }: {
            imports = [ ./hosts/m5-macbook-air/home.nix ];
            home.homeDirectory = pkgs.lib.mkForce "/Users/atsune";
            home.username = pkgs.lib.mkForce "atsune";
          };
        }
      ];
    };

    # ============================================================
    # Debian/Linux Configurations (Home Manager only)
    # ============================================================
    homeConfigurations.google-vm-instance-0 = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./hosts/google-vm-instance-0/home.nix
        {
          home.username = "maomudunyin";
          home.homeDirectory = "/home/maomudunyin";
        }
      ];
    };
  };
}
