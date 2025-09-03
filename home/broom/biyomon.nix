{
  pkgs,
  inputs,
  outputs,
  ...
}: let
  username = "broom";
in {
  imports = [
    outputs.homeManagerModules.fonts

    ../../features/home-manager/cli
    ../../features/home-manager/dev/nixvim
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    #sessionPath = [ "$HOME/.local/bin" ];
  };

  home.packages = with pkgs; [
    git
    nixd

    unzip
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
    # Bluetooth MIDI controls
    mpris-proxy.enable = true;
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
