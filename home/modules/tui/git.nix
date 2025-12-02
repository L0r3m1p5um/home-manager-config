{
  programs = {
    git = {
      enable = true;
      ignores = [
        ".direnv/"
        "*.swp"
        ".vscode/"
        ".DS_Store"
      ];
      lfs.enable = true;
      settings = {
        user.name = "Michael Araujo";
        user.email = "michael.e.araujo@gmail.com";
        alias = {
          cm = "commit -m";
          co = "checkout";
          d = "diff";
          st = "status";
        };
        init.defaultBranch = "main";
      };
    };

    lazygit = {
      enable = true;
      settings = {
        gui = {
          # showFileTree = false;

          theme = {
            activeBorderColor = [
              "blue"
              "bold"
            ];
            selectedLineBgColor = [ "white" ];
          };
        };
        git = {
          # Improves performance
          # https://github.com/jesseduffield/lazygit/issues/2875#issuecomment-1665376437
          log.order = "default";

          fetchAll = false;
        };
      };
    };
  };

  home.shellAliases = {
    lg = "lazygit";

    gfu = "git fetch upstream";
    gfo = "git fetch origin";
  };

}
