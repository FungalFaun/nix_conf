{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
      ../../packages/nixos/bluetooth.nix
      ../../packages/nixos/boot.nix
      ../../packages/nixos/locale.nix
      ../../packages/nixos/pipewire.nix
      ../../packages/nixos/sddm.nix
      ../../packages/nixos/usb.nix

      ../../packages/nixos/networking.nix
    ];

  networking.hostName = "tux"; # Define your hostname.
  networking.networkmanager.enable = true;

  services = {
    upower.enable = true;

    # Configure keymap in X11
    xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };

  boot.loader.systemd-boot.configurationLimit = 10;

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2w";
    };

    settings.auto-optimise-store = true;
  };

  users.users.broom = {
    isNormalUser = true;
    description = "Broom";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    shell = pkgs.zsh;
    packages = [];
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];

    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.hyprland.enable = true;

  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gh
    home-manager

    kdePackages.sddm
    #sddm
    dconf
    wayland-protocols
    wayland-utils
    wlroots
    meson
    gcc
    curl
    brightnessctl
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
