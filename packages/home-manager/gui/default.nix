{
  pkgs,
  ...
}:
{
  imports = [
    ./gtk
    ./hyprland

    ./alacritty.nix
    ./firefox.nix
    ./font.nix
    ./mako.nix
    ./qt.nix
    ./swayosd.nix
    ./vlc.nix
    ./waybar.nix
    ./wofi.nix
  ];

  home.packages = with pkgs; [
    wf-recorder
    wl-clipboard
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    GDK_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
    XCURSOR_SIZE = 34;
  };

  # Use entire Hypr ecosystem
  programs.hypreco.enable = true;

  programs = {
    imv.enable = true;
  };

  services = {
    cliphist.enable = true;
  };

  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-wlr];
}
