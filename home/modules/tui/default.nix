{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./git.nix
    ./neovim
    ./packages.nix
    ./nushell
    ./nix.nix
  ];

  programs = {

	home-manager.enable = true;

	jq.enable = true;
	
	bat.enable = true;
	bat.config.theme = "gruvbox-dark";

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

    packages = with pkgs; [
      # Rust implementations of linux commands
      bat # cat
      bottom # System monitor
      du-dust # du
      dua # du
      fd # find
      dysk # df
      procs # ps
      ripgrep

      # Other utils
      htop
      ncdu
      sshfs
      tlrc
    ];
  };
}
