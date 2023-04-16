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
#    gcc
  ];

  containers = with pkgs; [
    kubectl
    minikube
  ];

  homePackages = with pkgs; [
    ripgrep
    git-crypt
    openssl
    just
    sqlite
    tree
    wget
    elixir
    (pkgs.callPackage ./buck2 { })
  ];
  
in
python ++ homePackages ++ rust ++ containers
