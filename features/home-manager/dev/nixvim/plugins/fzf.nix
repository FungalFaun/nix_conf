{
  programs.nixvim.plugins = {
    fzf-lua = {
      enable = true;
      
      keymaps = {
        "<leader>/" = {
          action = "live_grep";
          options.desc = "Live grep";
        };
        "<leader>sd" = {
          action = "diagnostics_document";
          options.desc = "Document Diagnostics";
        };
        "<leader>sD" = {
          action = "diagnostics_workspace";
          options.desc = "Workspace Diagnostics";
        };
        "<leader>sh" = {
          action = "help_tags";
          options.desc = "Help Pages";
        };
        "<leader>sk" = {
          action = "keymaps";
          options.desc = "Key maps";
        };
      };
    };
  };
}
