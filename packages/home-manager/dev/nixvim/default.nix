{
  inputs,
  pkgs,
  ...
}: {
  # Import all your configuration modules here
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/autopairs.nix
    ./plugins/barbar.nix
    ./plugins/bufferline.nix
    ./plugins/cmp.nix
    ./plugins/comment.nix
    ./plugins/fzf.nix
    ./plugins/gitsigns.nix
    ./plugins/indent-blankline.nix
    ./plugins/lsp.nix
    ./plugins/lualine.nix
    ./plugins/neo-tree.nix
    ./plugins/snacks.nix
    ./plugins/startify.nix
    ./plugins/terminal.nix
    ./plugins/which-key.nix

    ./plugins/temp-bread.nix

    ./opts.nix
    ./auto_cmds.nix
  ];

  home.packages = with pkgs; [
    alejandra
  ];

  # This could conflict with the home file
  # nix.nixPath = [ "import <nixpkgs> { }"];

  programs.nixvim = { enable = true;
    defaultEditor = true;

    colorschemes.gruvbox = {
      enable = true;
      settings = {
        italic = {
          strings = false;
          comments = true;
        };
      };
    };

    viAlias = true;
    vimAlias = true;

    globals.mapleader = " ";
  };
}
