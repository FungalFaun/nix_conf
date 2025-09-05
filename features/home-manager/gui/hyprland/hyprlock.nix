{
  config,
  lib,
  ...
}:{
  programs.hyprlock = {
    enable = true;
    settings = {
      general.hide_cursor = false;
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
