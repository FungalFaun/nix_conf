{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.modules.gui;
in {
  imports = [
    ./browser/firefox.nix
    ./browser/librewolf.nix
    ./browser/vivaldi.nix
    ./gtk
    ./hyprland
    ./waybar

    ./alacritty.nix
    ./discord.nix
    ./font.nix
    ./mako.nix
    ./obs.nix
    ./obsidian.nix
    ./playerctl.nix
    ./printing.nix
    ./qt.nix
    ./swayosd.nix
    ./telegram.nix
    ./torrent.nix
    ./vlc.nix
    ./wofi.nix
  ];

  options.modules.gui = {
    enable = lib.mkEnableOption "Enable GUI";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      wf-recorder
      wl-clipboard
      wpa_supplicant_gui
    ];

    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
      GDK_BACKEND = "wayland";
      QT_QPA_PLATFORM = "wayland";
      XCURSOR_SIZE = 34;
    };

    programs = {
      imv.enable = true;
    };

    services = {
      cliphist.enable = true;
    };

    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-wlr];
  };
}
