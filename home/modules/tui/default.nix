{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ./git.nix
    ./neovim
    ./packages.nix
    ./nushell
    ./nix.nix
    ./zellij.nix
    ./helix.nix
  ];

  fonts.fontconfig.enable = true;

  xdg = {
    enable = true;
  };

  programs = {

    home-manager.enable = true;

    jq.enable = true;

    bat = {
      enable = true;
      config.theme = "gruvbox-dark";
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
        batwatch
      ];
      syntaxes = {
        gleam = {
          src = pkgs.fetchFromGitHub {
            owner = "digitalcora";
            repo = "sublime-text-gleam";
            rev = "8bc9f62dbf6e8a5798f8fed65c10fb6a41c51291";
            hash = "sha256-CJkrOJArBk71E/qwbawSwkqdQgLDkJvGkiy4CNQ3e4k=";
          };
          file = "package/Gleam.sublime-syntax";
        };
        nushell = {
          src = pkgs.fetchFromGitHub {
            owner = "stevenxxiu";
            repo = "sublime_text_nushell";
            rev = "66b00ff639dc8cecb688a0e1d81d13613b772f66";
            hash = "sha256-paayZP6P+tzGnla7k+HrF+dcTKUyU806MTtUeurhvdg=";
          };
          file = "nushell.sublime-syntax";
        };
      };
    };

    oh-my-posh = {
      enable = true;
      useTheme = "gruvbox";
    };

    direnv = {
      enable = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };

  };

  home = {
    stateVersion = "24.11";

    username = lib.mkDefault "michael";
    homeDirectory = lib.mkDefault "/home/michael";
  };
}
