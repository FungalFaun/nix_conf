{
  self,
  inputs,
  pkgs,
  ...
}: {
  # Import all your configuration modules here
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./autopairs.nix
    ./bufferline.nix
    ./cmp.nix
    ./indent-blankline.nix
    ./lsp.nix
    ./neo-tree.nix
    ./opts.nix
  ];

  home.packages = with pkgs; [
    alejandra
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.gruvbox.enable = true;

    viAlias = true;
    vimAlias = true;
    plugins = {
      lualine.enable = true;
    };

    globals.mapleader = " ";
  };
}
