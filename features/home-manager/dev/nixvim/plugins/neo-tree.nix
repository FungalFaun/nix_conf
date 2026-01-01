{self, ...}: {
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;
        settings = {
          close_if_last_window = true;
          window = {
            width = 30;
            auto_expand_width = true;
          };
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>n";
        action = ":Neotree action=focus reveal<CR>";
        options.silent = true;
      }
    ];

  };
}
