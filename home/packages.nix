{ homeDirectory, pkgs }:

let
  inherit pkgs;
  
  python = with pkgs; [ (python311.withPackages(ps: with ps; [
      pip
      requests
    ])) 
  ];

  rust = with pkgs; [
    rustup
    pkg-config
    gcc
  ];

  containers = with pkgs; [
    kubectl
    podman
    minikube
  ];

  homePackages = with pkgs; [
    ripgrep
    openssl
    sqlite
    tree
    wget
  ];
  
in
python ++ homePackages ++ rust ++ containers
