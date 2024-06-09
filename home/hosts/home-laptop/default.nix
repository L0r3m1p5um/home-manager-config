{
  pkgs,
  lib,
  ...
}: let
  homeDirectory = "/home/michael";
in {
  imports = [
    ../../modules/tui
  ];

  home = {
    username = "michael";
    inherit homeDirectory;
  };

  nix.package = pkgs.nix;
}
