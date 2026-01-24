{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;

      folding.enable = false;
      settings = {
        indent.enable = true;
        highlight.enable = true;
        incremental_selection.enable = true;
      };
    };

    treesitter-context.enable = true;

    hmts.enable = true;
  };
}
