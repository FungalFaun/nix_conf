# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ pkgs, inputs, outputs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    inputs.nixos-wsl.nixosModules.wsl
    # outputs.nixosModules.desktop

    ../users/broom.nix
    ../../modules/nixos/core
    # ../../features/nixos/common/nix-ld.nix
    # ../../features/nixos/common/fonts.nix
  ];

  wsl = {
    enable = true;
    defaultUser = "broom";

    wslConf = {
      network.hostname = "biyomon";
    };
  };

  # modules.desktop.enable = false;

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "dotnet-sdk-6.0.428"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
