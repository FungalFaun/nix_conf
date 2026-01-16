{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../thunar.nix
    ../gdm.nix
    ../swayosd-server.nix
  ];

  programs.hyprland = lib.mkDefault {
    enable = true;
    withUWSM = false;
  };

  environment.systemPackages = [
    pkgs.kitty
  ];

  security.pam.services.hyprlock = {};
}
