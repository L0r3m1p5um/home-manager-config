{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  # home.username = "michael";
  # home.homeDirectory = "/home/michael";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  # home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    htop
    ripgrep
    nushell 
    kubectl
    python311
  ];

  home.file = {
    ".config/alacritty/alacritty.yml".text = ''
      {"font":{"bold":{"style":"Bold"}}}
    '';
  };

  programs.git = {
    enable = true;
    userName = "Michael Araujo";
    userEmail = "michael.e.araujo@gmail.com";
    ignores = [
      ".direnv/"
      "*.swp"
      ".vscode/"
      ".DS_Store"
    ];
    aliases = {
      cm = "commit -m";
      co = "checkout";
      d = "diff";
      st = "status";
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # home.file.".doom.d" = {
  #   source ./doom.d;
  #   recursive = true;
  #   onChange = builtins.readFile ./doom.sh;
  # };
  # home.file.".config/polybar/script/mic.sh" = {
  #   source = ./mic.sh;
  #   executable = true;
  # };
}
