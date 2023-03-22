{
  description = "Home manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils }:
    let
      username = "michael";
      system = "x86_64-linux";
      homeDirectory = "/home/michael";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      homeConfig = (import ./home { inherit homeDirectory pkgs system username; });
      inherit (home-manager.lib) homeManagerConfiguration;
    in {
      homeConfigurations = { 
        "${username}" = homeManagerConfiguration {
          inherit pkgs;
          modules = [
            homeConfig
          ];
        };

        extraSpecialArgs = { inherit nixpkgs; };
      };
    };
}
