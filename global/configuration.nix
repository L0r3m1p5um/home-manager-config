{ lib, pkgs, config, modulesPath, ... }:

with lib;
let
  nixos-wsl = import ./nixos-wsl;
in
{
  imports = [
    "${modulesPath}/profiles/minimal.nix"

    nixos-wsl.nixosModules.wsl
  ];

  wsl = {
    enable = true;
    automountPath = "/mnt";
    defaultUser = "nixos";
    startMenuLaunchers = true;

    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;

  };

  # Enable nix flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "22.05";

  programs.fish.enable = true;

  users.users.michael = {
    isNormalUser = true;
    home = "/home/michael";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  users.users.nixos.shell = pkgs.fish;

  environment = {
    systemPackages = with pkgs;
      [
        file
        wget
        curl
        vim
        htop
      ];  
#    etc = {
#      containers.source = ./containers;
#    };
  };

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
#      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
