{
  ...
}:{
  wayland.windowManager.hyprland.enable = true;
  programs.kitty.enable = true;

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
