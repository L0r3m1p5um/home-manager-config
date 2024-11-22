let
    tabSize = size: filetypes: {
      event = "FileType";
      pattern = filetypes;
      command = "setlocal tabstop=2 shiftwidth=2 expandtab";
    };

in {
  programs.nixvim.autoCmd = [
        # Enable spellcheck for some filetypes
        {
          event = "FileType";
          pattern = [
            "tex"
            "latex"
            "markdown"
          ];
          command = "setlocal spell spelllang=en";
        }
        (tabSize 2 ["gleam" "nix"])
        {
          event = "FileType";
          pattern = ["gleam" "nu" "dhall"];
          command = "TSBufEnable highlight";
        }
      ];
}
