{self, ...}: {
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;
        closeIfLastWindow = true;
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
