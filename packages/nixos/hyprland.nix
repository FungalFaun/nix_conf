{
  pkgs,
  config,
  lib,
  ...
}:let
  cfg = config.programs.hypreco;
in {
# This might not be necessary and rather set with home-manager
  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
    };

    environment.systemPackages = [
      pkgs.kitty
    ];
  };
}
