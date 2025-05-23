{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;

      folding = false;
      settings = {
        indent.enable = true;
        highlight.enable = true;
        incremental_selection.enable = true;
      };
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;
  };
}
