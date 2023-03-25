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

  imports = [
    "${fetchTarball {
      url = "https://github.com/msteen/nixos-vscode-server/tarball/master";
      sha256 = "0ahgyd2swkapimvf70ah2y55wpn2hdh1wymfh6492xrkv5x91sqz";
    }}/modules/vscode-server/home.nix"
  ];

  services.vscode-server.enable = true;

  # services = import ./services.nix;

  # xdg = import ./xdg.nix;
}
