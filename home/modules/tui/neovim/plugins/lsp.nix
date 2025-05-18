{
  programs.nixvim = {
    plugins = {
      lsp-format.enable = true;

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

        postConfig = "vim.lsp.enable('nickel_ls')";

        servers = {
          lua_ls.enable = true;
          rust_analyzer = {
            enable = true;
            installRustc = false;
            installCargo = false;
          };
          bashls.enable = true;
          dhall_lsp_server.enable = true;
          docker_compose_language_service.enable = true;
          gleam.enable = true;
          hls = {
            enable = true;
            installGhc = false;
          };
          helm_ls.enable = true;
          jsonls.enable = true;
          nushell.enable = true;
          nil_ls.enable = true;
          erlangls.enable = true;
          nickel_ls.enable = true;
        };
      };
    };
  };
}
