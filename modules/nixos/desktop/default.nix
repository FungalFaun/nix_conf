{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkDefault;
  cfg = config.modules.desktop;
in {
  imports = [
    ./peripherals
    
    ./filemanager.nix
    ./gaming.nix
    ./security.nix
    ./xdg.nix
  ];

  options.modules.desktop = {
    enable = lib.mkEnableOption "Enables the desktop and programs which require a gui";
  };

  config = lib.mkIf cfg.enable {
    # My modules --------------
    modules = {
      audio = mkDefault true;
      bluetooth = mkDefault true;

      thunar.enable = mkDefault true;
      gaming.enable = mkDefault false;

      desktop.security.enable = mkDefault true;
    };
    # --------------------------

    security.sudo.keepTerminfo = true; # Could this be in core?

    services = {
      udev.packages = with pkgs; [
        gnome-settings-daemon
      ];
    };

    programs = {
      dconf.enable = true;
    };
  };
}
