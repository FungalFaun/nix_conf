# https://github.com/fmoda3/nix-configs/blob/master/home/nvim/default.nix
{
  pkgs,
  config,
  lib,
  ...
}: 
with lib; {
  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./config/init.lua}
    '';
  };
}
