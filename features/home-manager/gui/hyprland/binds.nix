{ pkgs,
  config,
  lib,
  ...
}:{
  wayland.windowManager.hyprland.settings = let 
    swayosd = {
      brightness = "swayosd-client --brightness +0";
      output-volume = "swayosd-client --output-volume +0";
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

      bind = [
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

        # "$mod, V, exec, ${cliphist} list | ${wofi} --dmenu | ${cliphist} decode | ${wlcopy}"
        ''$mod, V, exec, selected=$(${cliphist} list | ${wofi} -S dmenu) && echo "$selected" | ${cliphist} decode | wl-copy''

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

        # " , XF86AudioMute, exec, ${swayosd} --output-volume mute-toggle"
        # " , XF86AudioMicMute, exec, ${swayosd} --input-volume input-toggle"
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

    bindel = [
      " , XF86AudioRaiseVolume, exec, ${pactl} set-sink-volume @DEFAULT_SINK@ +5%; ${swayosd.output-volume}"
      " , XF86AudioLowerVolume, exec, ${pactl} set-sink-volume @DEFAULT_SINK@ -5%; ${swayosd.output-volume}"

      " SHIFT, XF86AudioRaiseVolume, exec, ${pactl} set-source-volume @DEFAULT_SOURCE@ +5%; ${swayosd.output-volume}"
      " SHIFT, XF86AudioLowerVolume, exec, ${pactl} set-source-volume @DEFAULT_SOURCE@ -5%; ${swayosd.output-volume}"

      " , XF86MonBrightnessUp, exec, brightnessctl set 10%+; ${swayosd.brightness}"
      " , XF86MonBrightnessDown, exec, brightnessctl set 10%-; ${swayosd.brightness}"

      " CTRL, XF86MonBrightnessUp, exec, brightnessctl set 1%+; ${swayosd.brightness}"
      " CTRL, XF86MonBrightnessDown, exec, brightnessctl set 1%-; ${swayosd.brightness}"

      " SHIFT, XF86MonBrightnessUp, exec, brightnessctl set 100%; ${swayosd.brightness}"
      " SHIFT, XF86MonBrightnessDown, exec, brightnessctl set 1; ${swayosd.brightness}"
    ];

    # binde = [
    #   " , XF86AudioRaiseVolume, exec, ${swayosd} --output-volume raise --max-volume 180"
    #   " , XF86AudioLowerVolume, exec, ${swayosd} --output-volume lower --max-volume 180"
    #
    #   " , XF86MonBrightnessUp, exec, brightnessctl set 10%+"
    #   " , XF86MonBrightnessDown, exec, brightnessctl set 10%-"
    #
    #   " CTRL, XF86MonBrightnessUp, exec, brightnessctl set 1%+"
    #   " CTRL, XF86MonBrightnessDown, exec, brightnessctl set 1%-"
    #
    #   " SHIFT, XF86MonBrightnessUp, exec, brightnessctl set 100%"
    #   " SHIFT, XF86MonBrightnessDown, exec, brightnessctl set 1"
    # ];

    bindl = let 
      playerctl = lib.getExe' config.services.playerctld.package "playerctl";
      playerctld = lib.getExe' config.services.playerctld.package "playerctld";
    in lib.optionals config.services.playerctld.enable [
      # Media control
      " , XF86AudioNext, exec, ${playerctl} next"
      " , XF86AudioPrev, exec, ${playerctl} previous"
      " , XF86AudioPlay, exec, ${playerctl} play-pause"
      " , XF86AudioStop, exec, ${playerctl} stop"
      " SHIFT, XF86AudioNext, exec,${playerctld} shift"
      " SHIFT, XF86AudioPrev, exec,${playerctld} unshift"
      " SHIFT, XF86AudioPlay, exec,systemctl --user restart playerctld"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
