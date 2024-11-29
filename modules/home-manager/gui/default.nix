{
  lib,
  config,
  ...
}:
{
  imports = [
    ./hyprland/hyprland.nix
  ];

#  options = {
#    gui.enable = lib.mkEnableOption "GUI";
#  };

  programs.hypreco.enable = false;
}
