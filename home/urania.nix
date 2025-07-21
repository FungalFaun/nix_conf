{
  pkgs,
  inputs,
  outputs,
  ...
}: let
  username = "broom";
in {
  imports = [
    outputs.homeManagerModules.monitors
    outputs.homeManagerModules.fonts
    outputs.homeManagerModules.wallpaper
    inputs.zen-browser.homeModules.beta

    ../packages/home-manager/cli
    ../packages/home-manager/dev/nixvim
    ../packages/home-manager/gaming

    ../packages/home-manager/gui
  ];

  monitors = [
    {
      name = "HDMI-A-1";
      width = 1920;
      height = 1080;
      refreshRate = 60;
      scaling = "1.0";
      workspace = "1";
      primary = false;
      x = 0;
    }
    {
      name = "HDMI-A-2";
      width = 2560;
      height = 1440;
      refreshRate = 90;
      scaling = "1.0";
      workspace = "1";
      primary = true;
      x = 1920;
    }
    {
      name = "DP-2";
      width = 1920;
      height = 1080;
      refreshRate = 60;
      scaling = "1.0";
      workspace = "1";
      primary = false;
      x = 4480;
    }
  ];

  wallpaper = "outset_island/outset_island_evening.jpg";

  programs.gaming.enable = true;

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    #sessionPath = [ "$HOME/.local/bin" ];
  };

  home.packages = with pkgs; [
    git
    nixd

    hyprcursor
    hyprland-qtutils
    hyprsunset

    unzip
    gnome-disk-utility
    pwvucontrol

    vivaldi
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
