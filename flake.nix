{
  description = "Home manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
  };

  outputs = { self, nixpkgs, rust-overlay, home-manager, flake-utils }:
    let
      username = "michael";
      system = "x86_64-linux";
      homeDirectory = "/home/michael";
      overlays = [ (import rust-overlay) ];
      pkgs = import nixpkgs {
        inherit system overlays;
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
