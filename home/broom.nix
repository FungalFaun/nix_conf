{
  pkgs,
  inputs,
  outputs,
  ...
}:
{
  imports = [
    outputs.homeManagerModules.monitors
    outputs.homeManagerModules.fonts
    outputs.homeManagerModules.wallpaper

    ../packages/home-manager/cli
    ../packages/home-manager/cli/nixvim

    ../packages/home-manager/gui
  ];

  monitors = [
    {
      name = "eDP-1";
      width = 2880;
      height = 1800;
      refreshRate = 90;
      scaling = "1.5";
      workspace = "1";
      primary = true;
    }
  ];

  wallpaper = "attic.jpg";

  home = {
    username = "broom";
    homeDirectory = "/home/broom";
    #sessionPath = [ "$HOME/.local/bin" ];
  };

  home.packages = with pkgs; [
    git
    nixd

    hyprcursor
    hyprland-qtutils
    hyprsunset
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
