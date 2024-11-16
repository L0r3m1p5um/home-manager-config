{
  programs = {
    git = {
      enable = true;
      userName = "Michael Araujo";
      userEmail = "michael.e.araujo@gmail.com";
      lfs.enable = true;
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

    lazygit = {
      enable = true;
      settings = {
        gui = {
          # showFileTree = false;

          theme = {
            activeBorderColor = ["blue" "bold"];
            selectedLineBgColor = ["white"];
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
