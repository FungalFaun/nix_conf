{
  pkgs,
  inputs,
  outputs,
  ...
}:
{
  imports = [
    outputs.homeManagerModules.fonts

    ../packages/home-manager/cli
  ];

  home = {
    username = "broom";
    homeDirectory = "/home/broom";
    #sessionPath = [ "$HOME/.local/bin" ];
  };

  home.packages = with pkgs; [
    git
    nixd
    gcc
    cmake
    cargo
    rustc
    neovim
  ];


  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nix;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  services = {
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
