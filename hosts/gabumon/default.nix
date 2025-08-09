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

    ../../features/nixos/common

    ../../features/nixos/gaming.nix
    ../../features/nixos/logitech.nix
    ../../features/nixos/stream-deck.nix
  ];

  networking.hostName = "gabumon"; # Define your hostname.

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.configurationLimit = 10;
  };

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
