{
  lib,
  config,
  pkgs,
  ...
}: let 
  cfg = config.desktopEnv.kde;
in {
  options.desktopEnv.kde = {
    enable = lib.mkEnableOption "Use KDE as your display manager";
  };

  config = lib.mkIf cfg.enable {
    services = {
      desktopManager.plasma6 = {
        enable = true;
        enableQt5Integration = true;
      };

      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };

    environment.plasma6.excludePackages = with pkgs; [];
  };
}