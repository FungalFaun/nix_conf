{ pkgs,
  config,
  lib,
  ...
}:{
  wayland.windowManager.hyprland.settings = let 
    swayosd = {
      brightness = "swayosd-client --brightness +0";
      output-volume = "swayosd-client --output-volume +0 --max-volume 180";
      input-volume = "swayosd-client --input-volume +0";
      caps-lock = "sleep 0.2 && swayosd-client --caps-lock";
    };

    grim = lib.getExe pkgs.grim;
    slurp = lib.getExe pkgs.slurp;
    # wlcopy = lib.getExe' pkgs.wl-clipboard "wl-copy";
    # swayosd = lib.getExe' pkgs.swayosd "swayosd-client";
    wofi = lib.getExe config.programs.wofi.package;
    thunar = lib.getExe pkgs.xfce.thunar;
    cliphist = lib.getExe config.services.cliphist.package;
    pactl = lib.getExe' pkgs.pulseaudio "pactl";
  in {
    "$mod" = "SUPER";

    # Bind Flags:
    # l -> works while locked
    # e -> repeats if held
    # m -> mouse binds

      bind = [
        "$mod, Q, exec, alacritty"
        "$mod, W, exec, librewolf"
        "$mod & CTRL, W, exec, librewolf -private-window"
        "$mod, T, exec, Telegram"

        "$mod, space, exec, ${wofi} --show drun"

        "ALT, C, killactive, "
        "ALT, M, exit, "
        "$mod, E, exec, ${thunar}"
        "$mod, M, togglefloating, "
        "$mod, P, pseudo, # dwindle"
        "$mod, J, togglesplit, "

        ''$mod, V, exec, selected=$(${cliphist} list | ${wofi} -S dmenu) && echo "$selected" | ${cliphist} decode | wl-copy''

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # "$mod, S, togglespecialworkspace, magic"
        # "$mod SHIFT, S, movetoworkspace, special:magic"

        "$mod, S, exec, ${grim}"
        "$mod & CTRL, S, exec, ${slurp} | ${grim} -g -"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

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

    # Repeatable and works when locked
    bindel = [
      " , XF86AudioRaiseVolume, exec, ${pactl} set-sink-volume @DEFAULT_SINK@ +5%; ${swayosd.output-volume}"
      " , XF86AudioLowerVolume, exec, ${pactl} set-sink-volume @DEFAULT_SINK@ -5%; ${swayosd.output-volume}"

      " SHIFT, XF86AudioRaiseVolume, exec, ${pactl} set-source-volume @DEFAULT_SOURCE@ +5%; ${swayosd.input-volume}"
      " SHIFT, XF86AudioLowerVolume, exec, ${pactl} set-source-volume @DEFAULT_SOURCE@ -5%; ${swayosd.input-volume}"

      " , XF86MonBrightnessUp, exec, brightnessctl set 10%+; ${swayosd.brightness}"
      " , XF86MonBrightnessDown, exec, brightnessctl set 10%-; ${swayosd.brightness}"

      " CTRL, XF86MonBrightnessUp, exec, brightnessctl set 1%+; ${swayosd.brightness}"
      " CTRL, XF86MonBrightnessDown, exec, brightnessctl set 1%-; ${swayosd.brightness}"

      " SHIFT, XF86MonBrightnessUp, exec, brightnessctl set 100%; ${swayosd.brightness}"
      " SHIFT, XF86MonBrightnessDown, exec, brightnessctl set 1; ${swayosd.brightness}"
    ];

    # Available while locked
    bindl = let 
      playerctl = lib.getExe' config.services.playerctld.package "playerctl";
      playerctld = lib.getExe' config.services.playerctld.package "playerctld";
    in lib.optionals config.services.playerctld.enable [
      " , XF86AudioMute, exec, ${pactl} set-sink-mute @DEFAULT_SINK@ toggle; ${swayosd.output-volume}"
      " SHIFT, XF86AudioMute, exec, ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle; ${swayosd.input-volume}"

      # Media control
      " , XF86AudioNext, exec, ${playerctl} next"
      " , XF86AudioPrev, exec, ${playerctl} previous"
      " , XF86AudioPlay, exec, ${playerctl} play-pause"
      " , XF86AudioStop, exec, ${playerctl} stop"

      " SHIFT, XF86AudioNext, exec,${playerctld} shift"
      " SHIFT, XF86AudioPrev, exec,${playerctld} unshift"
      " SHIFT, XF86AudioPlay, exec,systemctl --user restart playerctld"
    ];

    # Bind mouse
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
