{
  pkgs,
  inputs,
  outputs,
  ...
}: let
  username = "broom";
in {
  imports = [
    ../../features/home-manager/cli
    ../../features/home-manager/dev/nixvim
    ../../features/home-manager/dev/nodejs.nix

    ../../features/home-manager/gui/browser/librewolf.nix
    ../../features/home-manager/gui/browser/vivaldi.nix
    ../../features/home-manager/gui/alacritty.nix
    ../../features/home-manager/gui/discord.nix
    ../../features/home-manager/gui/obsidian.nix
    ../../features/home-manager/gui/printing.nix
    ../../features/home-manager/gui/telegram.nix
    ../../features/home-manager/gui/vlc.nix
    ../../features/home-manager/gui/vscode.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
  };

  home.packages = with pkgs; [
    git
    nixd
    openssl

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
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
