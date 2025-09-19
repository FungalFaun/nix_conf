{
  pkgs,
  config,
  lib,
  ...
}:{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

      bind = let
      grim = lib.getExe pkgs.grim;
      slurp = lib.getExe pkgs.slurp;
      wlcopy = lib.getExe' pkgs.wl-clipboard "wl-copy";
      swayosd = lib.getExe' pkgs.swayosd "swayosd-client";
      # notify-send = lib.getExe' pkgs.libnotify "notify-send";
      wofi = lib.getExe config.programs.wofi.package;
      thunar = lib.getExe pkgs.xfce.thunar;
      cliphist = lib.getExe pkgs.cliphist;
    in
      [
        "$mod, Q, exec, alacritty"
        "$mod, W, exec, librewolf"
        "$mod, Z, exec, zen"
        "$mod & CTRL, W, exec, firefox -private-window"
        "$mod, T, exec, Telegram"

        "$mod, space, exec, ${wofi} --show drun"

        "ALT, C, killactive, "
        "ALT, M, exit, "
        "$mod, E, exec, ${thunar}"
        "$mod, V, togglefloating, "
        "$mod, P, pseudo, # dwindle"
        "$mod, J, togglesplit, "

        "$mod, V, exec, ${cliphist} list | ${wofi} --dmenu | ${cliphist} decode | ${wlcopy}"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        #            "$mod, S, togglespecialworkspace, magic"
        #            "$mod SHIFT, S, movetoworkspace, special:magic"

        "$mod, S, exec, ${grim}"
        "$mod & CTRL, S, exec, ${slurp} | ${grim} -g -"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        #            "$mod, M, exec, ${grimblast} --notify --freeze copysave area"
        #            "$mod SHIFT, M, exec, ${grimblast} --notify --freeze copysave output"

        " , XF86AudioMute, exec, ${swayosd} --output-volume mute-toggle"
        " , XF86AudioMicMute, exec, ${swayosd} --input-volume input-toggle"
      ]
      ++ (builtins.concatLists (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )
        10));

    binde = let
      swayosd = lib.getExe' pkgs.swayosd "swayosd-client";
    in [
      " , XF86AudioRaiseVolume, exec, ${swayosd} --output-volume raise --max-volume 180"
      " , XF86AudioLowerVolume, exec, ${swayosd} --output-volume lower --max-volume 180"

      " , XF86MonBrightnessUp, exec, brightnessctl set 10%+"
      " , XF86MonBrightnessDown, exec, brightnessctl set 10%-"

      " CTRL, XF86MonBrightnessUp, exec, brightnessctl set 1%+"
      " CTRL, XF86MonBrightnessDown, exec, brightnessctl set 1%-"

      " SHIFT, XF86MonBrightnessUp, exec, brightnessctl set 100%"
      " SHIFT, XF86MonBrightnessDown, exec, brightnessctl set 1"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
