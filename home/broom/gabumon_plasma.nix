{
  pkgs,
  inputs,
  outputs,
  ...
}: let
  username = "broom";
in {
  # Temp config without Hyprland
  imports = [
    outputs.homeManagerModules.fonts
    outputs.homeManagerModules.wallpaper

    ../../features/home-manager/cli
    ../../features/home-manager/dev/nixvim
    ../../features/home-manager/gui

    # ../../features/home-manager/gui/browser/librewolf.nix
    # ../../features/home-manager/gui/browser/vivaldi.nix

  ];

  wallpaper = "outset_island/outset_island_evening.jpg";

  home = {
    username = username;
    homeDirectory = "/home/${username}";
  };

  home.packages = with pkgs; [
    git
    nixd

    unzip
    pwvucontrol
    mission-center
  ];

  nixpkgs.config.allowUnfree = true;

  nix = {
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
