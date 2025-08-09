{
  pkgs, 
  inputs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../../features/nixos/bluetooth.nix
    ../../features/nixos/boot.nix
    ../../features/nixos/fonts.nix
    ../../features/nixos/gaming.nix
    ../../features/nixos/hyprland.nix
    ../../features/nixos/locale.nix
    ../../features/nixos/logitech.nix
    ../../features/nixos/pipewire.nix
    ../../features/nixos/sddm.nix
    ../../features/nixos/stream-deck.nix
    ../../features/nixos/swayosd-server.nix
    ../../features/nixos/usb.nix

    ../../features/nixos/networking.nix
  ];

  networking = {
    hostName = "gabumon"; # Define your hostname.
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

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # kernelPackages = pkgs.linuxPackages_6_11; # test previous kernel version
    loader.systemd-boot.configurationLimit = 10;
  };

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
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
    ];
    shell = pkgs.zsh;
    packages = [];
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  programs.hyprland.enable = true;

  programs.zsh.enable = true;
  environment.pathsToLink = ["/share/zsh"];

  # Allow unfree packages
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

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.enableAllFirmware = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
