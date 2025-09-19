{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ../users/broom.nix
      ../../features/nixos/common
      # ../../features/nixos/greetd.nix
      ../../features/nixos/hyprland.nix
    ];

  networking.hostName = "tentomon";

  # Connect home-manager
  # home-manager.users.broom = import ../../home/tentomon.nix;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.configurationLimit = 10;
  };

  programs = {
    hyprland.enable = true;
  };
  
  nixpkgs.config.allowUnfree = true;
  hardware.enableAllFirmware = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
