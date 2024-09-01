{ pkgs, ... }:

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
    bottom # System monitor
    du-dust # du
    dua # du
    dysk # df
    procs # ps

    # Other utils
    htop
    ncdu
    sshfs
    tlrc

    ripgrep
    fd
    git-crypt
    openssl
    just
    sqlite
    tree
    wget
    elixir
    dhall-json
    dhall
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })

    # Nix lsp
    nil
  ];

  gleam_reqs = with pkgs; [
    gleam
    erlang
  ];

  embedded = with pkgs; [
    gdb
    minicom
    openocd
  ];

  haskell_tools = with pkgs; [
    haskell.compiler.ghcHEAD
    haskellPackages.haskell-language-server
    ormolu
    hlint
  ];

in
{ home.packages = builtins.concatLists [
    python
    homePackages
    rust
    containers
    haskell_tools
    embedded
    gleam_reqs
  ];
}
