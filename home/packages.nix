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
  ];

  homePackages = with pkgs; [
    ripgrep
    kubectl
    minikube
    openssl
    pkg-config
    sqlite
    tree
    wget
  ];
  
in
python ++ homePackages ++ rust
