{
  lib,
  config,
  ...
}: let 
  cfg = config.desktopEnv.gnome;
in {
  options.desktopEnv.gnome = {
    enable = lib.mkEnableOption "Use GNOME as your display manager";
  };

  config = lib.mkIf cfg.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
  };
}