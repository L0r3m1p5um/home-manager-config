{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          lua-ls.enable = true;
          rust-analyzer.enable = true;
          bashls.enable = true;
          dhall-lsp-server.enable = true;
          docker-compose-language-service.enable = true;
          gleam.enable = true;
          hls.enable = true;
          helm-ls.enable = true;
          jsonls.enable = true;
          nushell.enable = true;
	  nil-ls.enable = true;
        };
      };
    };
  };
}
