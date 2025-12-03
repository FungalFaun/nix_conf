{
  lib,
  config,
  ...
}: let 
  cfg = config.desktopEnv.hyprland;
in {
  options.desktopEnv.hyprland = {
    enable = lib.mkEnableOption "Use Hyprland as your display manager";
  };

  config = lib.mkIf cfg.enable {
    # Enable hyprland
  };
}
