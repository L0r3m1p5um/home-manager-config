{ homeDirectory, pkgs, system, username }:

let
  stateVersion = "22.11";
  packages = import ./packages.nix { inherit homeDirectory pkgs; };
  nixPkg = pkgs.nixUnstable;
in
{
  # initial home config
  home = { inherit homeDirectory packages stateVersion username; };

  # nix = import ./nix.nix { nix = nixPkg; inherit username; };

  nixpkgs = { config = { allowUnfree = true; }; };

  # Allow Nix to handle my fonts
  # fonts = { fontconfig = { enable = true; }; };

  programs =
    import ./programs.nix { inherit homeDirectory pkgs username; };

  # services = import ./services.nix;

  # xdg = import ./xdg.nix;
}
