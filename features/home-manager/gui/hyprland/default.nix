{ lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./binds.nix
    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprlock.nix
    ../clipboard.nix
  ];

  xdg.portal = let
    hyprland = config.wayland.windowManager.hyprland.package;
    # xdph = pkgs.xdg-desktop-portal-hyprland.override {inherit hyprland;};
  in {
    extraPortals = [
      # xdph
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [hyprland];
  };

  programs.hyprlock = {
    enable = true;
  };
  services.hyprpolkitagent.enable = true;

  home.packages = with pkgs; [
    grim
    slurp
    swayosd
    wl-clip-persist

    hyprpicker
    hyprcursor
    hyprsysteminfo

    # nwg-bar
    # nwg-hello
    # nwg-displays
    # nwg-clipman

    # TODO: https://wiki.hypr.land/Configuring/Permissions/
    hyprland-qtutils
    hyprland-qt-support
    hyprland-protocols
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    GRIM_DEFAULT_DIR = "${config.home.homeDirectory}/Pictures/screenshots";
  };

  home.file = {
    ".local/share/icons/PhingerCursors".source = "${pkgs.phinger-cursors}";
  };

  wayland.windowManager.hyprland = {
    enable = true;

    systemd = {
      enable = true;
      # Not sure if this is necessary
      # Same as default, but stop graphical-session too
      # extraCommands = lib.mkBefore [
      #   "systemctl --user stop graphical-session.target" 
      #   "systemctl --user start hyprland-session.target"
      # ];
    };

    settings = {
      monitor =
        []
        ++ (map (
          m: let 
            resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
          in "${m.name}, ${
            if m.enabled
            then "${resolution}, ${m.position}, ${m.scaling}"
            else "disable"
          }"
        ) (config.monitors));

      env = [
        "HYPRCURSOR_THEME, phinger-cursors-light"
        "HYPRCURSOR_SIZE, 24"
        "XCURSOR_THEME, phinger-cursors-light"
        "XCURSOR_SIZE, 24"
      ];

      windowrulev2 = let 
        pwvucontrol = "class:com.saivert.pwvucontrol";
        gnome-disks = "class:gnome-disks";
        steamGame = "class:steam_app_[0-9]";

        file-operation = "class:thunar, title:File Operation Progress";
        file-rename = "class:thunar, title:Rename \"(.*)\"";
      in [
        "float, ${pwvucontrol}"
        "float, ${gnome-disks}"

        "float, ${file-operation}"
        "float, ${file-rename}"

        "fullscreen, ${steamGame}"
        "monitor:0, ${steamGame}"
      ];

      input = {
        kb_layout = "us";
        kb_variant = "altgr-intl";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
          "tap-to-click" = false;
          clickfinger_behavior = true;
        };

        sensitivity = 0;
      };

      general = {
        gaps_in = 3;
        gaps_out = 10;
        border_size = 1;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";

        allow_tearing = false;
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 5;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";

        };
      };

      animations = {
        enabled = true;

        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];

      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };


      gestures = {
        gesture =  [
          "3, horizontal, workspace"
        ];
      };

      misc = {
        force_default_wallpaper = 0;
      };
    };
  };
}
