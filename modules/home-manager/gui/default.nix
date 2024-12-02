{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hyprland
    ./mako.nix
    ./vlc.nix

    ./waybar.nix
  ];

  home.packages = with pkgs; [
    wf-recorder
    wl-clipboard
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    XCURSOR_SIZE = 34;
  };

#  options = {
#    gui.enable = lib.mkEnableOption "GUI";
#  };

  programs.hypreco.enable = true;
}
