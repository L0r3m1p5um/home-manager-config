{ homeDirectory, pkgs }:

let
  inherit pkgs;
  
  python = with pkgs; [ (python311.withPackages(ps: with ps; [
      pip
      requests
    ])) 
  ];

  rust = with pkgs; [
    rust-bin.stable.latest.default
  ];

  homePackages = with pkgs; [
    ripgrep
    kubectl
    minikube
    openssl
    pkg-config
    gcc
    sqlite
    tree
    wget
  ];
  
in
python ++ homePackages ++ rust
