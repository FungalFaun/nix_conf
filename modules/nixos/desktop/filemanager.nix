{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.modules.thunar;
in {
  options.modules.thunar = {
    enable = lib.mkEnableOption "Thunar file manager";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      thunar = {
        enable = true;

        plugins = with pkgs.xfce; [
          thunar-archive-plugin
          thunar-volman
        ];
      };

      gnome-disks.enable = true;
    };

    services = {
      gvfs.enable = true; # Automatic mounting of USB etc.
      tumbler.enable = true; # Show thumbnails in file explorer
      printing.enable = true; 
    };

    # Fetch and build for nix
    # https://github.com/omentic/thunar-stl-thumbnails
  };
}