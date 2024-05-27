{ homeDirectory, pkgs }:

let
  inherit pkgs;
  
  python = with pkgs; [ (python311.withPackages(ps: with ps; [
      pip
      requests
      virtualenv
    ])) 
  ];

  rust = with pkgs; [
    rustup
    pkg-config
    gcc
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
    dhall-json
    dhall
  ];

  haskell_tools = with pkgs; [
    haskell.compiler.ghcHEAD
    haskellPackages.haskell-language-server
    ormolu
    hlint
    
  ];
  
in
python ++ homePackages ++ rust ++ containers ++ haskell_tools
