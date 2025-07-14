{
  pkgs,
  ...
}:
{
  imports = [
    ./browser/firefox.nix
    ./browser/zen.nix
    ./gtk
    ./hyprland
    ./waybar

    ./alacritty.nix
    ./font.nix
    ./mako.nix
    ./obsidian.nix
    ./qt.nix
    ./screenshot.nix
    ./swayosd.nix
    ./telegram.nix
    ./vlc.nix
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
