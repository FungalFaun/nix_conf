{
  programs.nixvim.plugins = {
# https://github.com/GaetanLepage/nix-config/blob/master/modules/home/core/programs/neovim/_plugins/snacks.nix
# TODO Find good configs, this seems big
    snacks = {
      enable = false;
    };
  };
}
