# in flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          name = "simple";
          src = ./.;
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
            spin =
              let
                version = "1.0.0";
                os = "linux";
                arch = "amd64"
                pkgs = nixpkgs.legacyPackages.x86_64-linux;
                inherit (pkgs) stdenv lib;
              in
              stdenv.mkDerivation
                {
                  name = "spin-${version}";

                  # https://nixos.wiki/wiki/Packaging/Binaries
                  src = pkgs.fetchurl {
                    url = "https://github.com/fermyon/spin/releases/download/v1.0.0/spin-v${version}-${os}-${arch}.tar.gz";
                    sha256 = "sha256-MoMX6PEtvPmloXJwRpnC2lHlT+tozsV4dmbCqweyyI0=";
                  };

                  dontUnpack = false;
                  sourceRoot = ".";

                  installPhase = ''
                    install -m755 -D $src $out/bin/shaka-packager
                  '';

                  meta = with nixpkgs.lib; {
                    homepage = "https://github.com/fermyon/spin";
                    description =
                      "Framework for building deploying and running microservices with WebAssembly";
                  };
                };
        }
      );
}
