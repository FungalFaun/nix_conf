{
  pkgs,
  config,
  lib,
  ...
}:let
  # cfg = config.programs.hypreco;
in {
# This might not be necessary and rather set with home-manager
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };

    environment.systemPackages = [
      pkgs.kitty
    ];

    # environment.sessionVariables = {
    #   NIXOS_OZONE_WL = 1;
    # };
}
