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

    ../users/broom.nix

    ../../features/nixos/common

    ../../features/nixos/gaming.nix
    ../../features/nixos/greetd.nix
    ../../features/nixos/hyprland.nix
    ../../features/nixos/logitech.nix
    ../../features/nixos/rgb.nix
    ../../features/nixos/stream-deck.nix
    ../../features/nixos/zsa.nix
  ];

  networking.hostName = "gabumon";

  # Connect home-manager
  # home-manager.users.broom = import ../../home/gabumon.nix;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.configurationLimit = 10;
  };

  programs = {
    hyprland.enable = true;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    enableAllFirmware = true;
  };

  nixpkgs.config.allowUnfree = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
