{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ../../features/nixos/plasma

      ../../features/nixos/common/bluetooth.nix
      ../../features/nixos/common/boot.nix
      ../../features/nixos/common/fonts.nix
      ../../features/nixos/common/locale.nix
      ../../features/nixos/common/networking.nix
      ../../features/nixos/common/nix-ld.nix
      ../../features/nixos/common/nix.nix
      ../../features/nixos/common/pipewire.nix
 
      ../users/broom.nix
    ];

  networking.hostName = "patamon";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  users.users.broom = {
    packages = with pkgs; [
      kdePackages.kate
      librewolf
      pulseaudio
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # neovim
    alacritty
    git
    ripgrep
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
