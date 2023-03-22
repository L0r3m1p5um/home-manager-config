{ homeDirectory, pkgs, username }:

{

  home-manager.enable = true;

  jq.enable = true;
  
  bat.enable = true;
  bat.config.theme = "gruvbox-dark";

  nushell = {
    enable = true;
  };

  git = {
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

  direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
  };

}
