{
  config,
  lib,
  ...
}: let 
  flakePath = "${config.xdg.configHome}/home-manager";
  imagePath = "${flakePath}/assets/wallpaper/${config.wallpaper}";
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      general.hide_cursor = false;

      background = {
        path = imagePath;
        blur_passes = 4;
      };

      input-field = {
        position = "0, 20%";
        halign = "center";
        valign = "center";
      };

      label = {
        text = "$TIME";
      };
    };
  };

  wayland.windowManager.hyprland = {
    settings = {
      bind = let
        hyprlock = lib.getExe config.programs.hyprlock.package;
      in [
        "SUPER, L, exec, ${hyprlock}"
      ];

    };
  };
}
