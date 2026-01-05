{
  pkgs,
  config,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.users.broom = {
    isNormalUser = true;
    description = "Broom";
    extraGroups = ifTheyExist [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "gamemode"
      "plugdev"
    ];
    shell = pkgs.zsh;
    packages = [];
  };

  programs = {
    zsh.enable = true;
  };
  
  networking = {
    networkmanager.enable = true;
  };

  services = {
    upower.enable = true;

    # Configure keymap in X11
    xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  environment.pathsToLink = ["/share/zsh"];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    home-manager

    dconf
    wayland-protocols
    wayland-utils
    wlroots
    meson
    gcc
    curl
    brightnessctl
  ];

}
