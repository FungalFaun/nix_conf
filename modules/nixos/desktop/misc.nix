{
  pkgs,
  config,
  lib,
  ...
}: let 
  cfg = config.modules.desktop.misc;
in {
  options.modules.desktop.misc = {
    enable = lib.mkEnableOption "Misceleneous items";
  };

  config = lib.mkIf cfg.enable {
    security.sudo.keepTerminfo = true; # Could this be in core?

    services = {
      gvfs.enable = true; # Automatic mounting of USB etc.
      tumbler.enable = true; # Show thumbnails in file explorer
      printing.enable = true; 

      udev.packages = with pkgs; [
        gnome-settings-daemon
      ];
    };

    programs = {
      dconf.enable = true;
    };
  };
}