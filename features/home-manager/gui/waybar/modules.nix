# [1] https://github.com/woioeow/hyprland-dotfiles/
{
  pkgs,
  lib,
  ...
}:{
  programs.waybar.settings.mainBar = {
    "hyprland/workspaces" = {
      on-scroll-up = "hyprctl dispatch workspace r-1";
      on-scroll-down = "hyprctl dispatch workspace r+1";
      on-click = "activate";
      active-only = false;
      all-outputs = true;
      format = "{icon}";
      format-icons = {
        active = "";
        #default = "";
        default = "";
      };
      persistent-workspaces = {
        "*" = 5;
      };
    };

    "wlr/taskbar" = {
      format = "{icon}";
      icon-size = 18;
      tooltip-format = "{title}";
      on-click = "activate";
      on-click-middle = "close";
      ignore-list = [
        "Alacritty"
        "kitty"
      ];
      rewrite = {
        "Firefox Web Browser" = "Firefox";
      };
    };

    "hyprland/window" = {
      max-length = 60;
      rewrite = {
        "(.*) - Chromium" = "$1";
      };
      separate-outputs = true;
    };

    "custom/empty" = {
      format = "";
    };

    "custom/nowplaying" = {
      # exec = "~/.config/ml4w/scripts/now-playing.sh";
      format = "  {text}";
      return-type = "json";
      interval = 1;
      escape = true;
      hide-empty-text = false;
      on-click = "playerctl play-pause";
      on-click-right = "playerctl next";
      on-click-middle = "playerctl previous";
      tooltip-format = "Left: Play/Pause\nRight: Next\nMiddle: Previous";
    };

    # "custom/cliphist" = {
    #   format = "";
    #   on-click = "sleep 0.1 && ~/.config/ml4w/scripts/cliphist.sh";
    #   on-click-right = "sleep 0.1 && ~/.config/ml4w/scripts/cliphist.sh d";
    #   on-click-middle = "sleep 0.1 && ~/.config/ml4w/scripts/cliphist.sh w";
    #   tooltip-format = "Left: Open clipboard Manager\nRight: Delete an entry\nMiddle: Clear list";
    # };

    # "custom/wallpaper" = {
    #   format = "";
    #   on-click = "bash -c waypaper &";
    #   on-click-right = "~/.config/hypr/scripts/wallpaper-effects.sh";
    #   tooltip-format = "Left: Select a wallpaper\nRight: Select wallpaper effect";
    # };

    "custom/calculator" = {
      format = "";
      on-click = "qalculate-gtk";
      tooltip-format = "Open calculator";
    };

    # "custom/appmenu" = {
    #   format = "Apps";
    #   on-click = "~/.config/hypr/scripts/launcher.sh";
    #   on-click-right = "~/.config/hypr/scripts/keybindings.sh";
    #   tooltip-format = "Left: Open the application launcher\nRight: Show all keybindings";
    # };

    # "custom/appmenuicon" = {
    #   format = "";
    #   on-click = "sleep 0.2; wofi -show drun -replace"; # Needs customization
    #   # on-click-right = "~/.config/hypr/scripts/keybindings.sh";
    #   tooltip-format = "Left: Open the application launcher\nRight: Show all keybindings";
    # };

    "custom/exit" = let
      nwg-bar = lib.getExe pkgs.nwg-bar;
    in {
      format = "";
      on-click = "${nwg-bar}";
      on-click-right = "hyprlock";
      tooltip-format = "Left: Power menu\nRight: Lock screen";
    };

    "custom/notification" = {
      tooltip-format = "Left: Notifications\nRight: Do not disturb";
      format = "{icon}";
      format-icons = {
        notification = "notifications_active";
        none = "notifications";
        dnd-notification = "notifications_active";
        dnd-none = "notifications_paused";
        inhibited-notification = "notification_important";
        inhibited-none = "notification_important";
        dnd-inhibited-notification = "notification_off";
        dnd-inhibited-none = "notifications_off";
      };
      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click = "swaync-client -t -sw";
      on-click-right = "swaync-client -d -sw";
      escape = true;
    };

    # "custom/hyprshade" = {
    #   format = "";
    #   tooltip-format = "Toggle Screen Shader";
    #   on-click = "sleep 0.5; ~/.config/hypr/scripts/hyprshade.sh";
    #   on-click-right = "sleep 0.5; ~/.config/hypr/scripts/hyprshade.sh rofi";
    # };

    # "custom/hypridle" = {
    #   format = "";
    #   return-type = "json";
    #   escape = true;
    #   exec-on-event = true;
    #   interval = 60;
    #   exec = "~/.config/hypr/scripts/hypridle.sh status";
    #   on-click = "~/.config/hypr/scripts/hypridle.sh toggle";
    # };

    tray = {
      icon-size = 21;
      spacing = 10;
    };

    disk = {
      interval = 30;
      format = "D {percentage_used}% ";
      path = "/";
      # on-click = "~/.config/ml4w/settings/system-monitor.sh";
    };

    "group/hardware" = {
      orientation = "inherit";
      drawer = {
        transition-duration = 300;
        children-class = "not-memory";
        transition-left-to-right = false;
      };
      modules = [
        # "custom/system"
        "disk"
        "cpu"
        # "memory"
        # "hyprland/language"
      ];
    };

    "group/tools" = {
      orientation = "inherit";
      drawer = {
        transition-duration = 300;
        children-class = "not-memory";
        transition-left-to-right = false;
      };
      modules = [
        # "custom/tools"
        # "custom/cliphist"
        # "custom/hypridle"
        # "custom/hyprshade"
        "power-profiles-daemon"
      ];
    };

    # "group/settings" = {
    #   orientation = "inherit";
    #   drawer = {
    #     transition-duration = 300;
    #     children-class = "not-memory";
    #     transition-left-to-right = true;
    #   };
    #   modules = [
    #     "custom/settings"
    #     "custom/waybarthemes"
    #     "custom/wallpaper"
    #   ];
    # };

    network = {
      format = "{ifname}";
      format-wifi = " {signalStrength}%";
      format-ethernet = "  {ifname}";
      format-disconnected = "Disconnected ⚠";
      tooltip-format = " {ifname} via {gwaddri}";
      tooltip-format-wifi = "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
      tooltip-format-ethernet = " {ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}";
      tooltip-format-disconnected = "Disconnected";
      max-length = 50;
      # on-click = "~/.config/ml4w/settings/networkmanager.sh";
      # on-click-right = "~/.config/ml4w/scripts/nm-applet.sh toggle";
    };

    clock = {
      format = "{:%H:%M}";
      rotate = 0;
      format-alt = "{  %d-%m-%y}";

      tooltip-format = "<span>{calendar}</span>";
      calendar = {
        mode = "month";
        format = {
          months = "<span color='#ff6699'><b>{}</b></span>";
          days = "<span color='#cdd6f4'><b>{}</b></span>";
          weekdays = "<span color='#7CD37C'><b>{}</b></span>";
          today = "<span color='#ffcc66'><b>{}</b></span>";
        };
      };
    };

    battery = {
      interval = 1;
      states = {
        # good = 95;
        warning = 30;
        critical = 15;
      };
      format = "{icon} {capacity}%";
      format-charging = "  {capacity}%";
      format-plugged = "  {capacity}%";
      format-alt = "{icon}  {time}";
      # format-good = ""; # An empty format will hide the module
      # format-full = "";
      format-icons = [
        " "
        " "
        " "
        " "
        " "
      ];
    };

    # battery = {
    #   bat = "BAT0";
    #   interval = 20;
    #   states = {
    #       warning = 30;
    #       critical = 20;
    #   };
    #   format = "{icon}";
    #   format-icons = ["" "" "" "" ""];
    #   tooltip-format = "{capacity}%";
    #   max-length = 20;
    # };

    power-profiles-daemon = {
      format = "{icon}";
      tooltip-format = "Power profile: {profile}\nDriver: {driver}";
      tooltip = true;
      format-icons = {
        default = "";
        performance = "";
        balanced = "";
        power-saver = "";
      };
    };

    cpu = {
      format = "{icon}";
      format-icons = [
        "▁"
        "▂"
        "▃"
        "▄"
        "▅"
        "▆"
        "▇"
        "█"
      ];
      tooltip = true;
      tooltip-format = "{usage}%";
    };

    backlight = {
      #device = "intel_backlight";
      format = "{icon}";
      tooltip = true;
      tooltip-format = "{percent}%";
      format-icons = [
        "󰃞" 
        "󰃝"
        "󰃟"
        "󰃠"
      ];
    };

    bluetooth = {
      format = " {status}";
      format-disabled = "";
      format-off = "";
      interval = 30;
      # on-click = "sleep 0.1 && ~/.config/ml4w/settings/bluetooth.sh";
      format-no-controller = "";
    };

    user = {
      format = "{user}";
      interval = 60;
      icon = false;
    };

    idle_inhibitor = {
      format = "{icon}";
      format-icons = {
        activated = "";
        deactivated = "";
      };
    };

    pulseaudio = {
      # scroll-step: 1; # %, can be a float
      format = "{icon}  {volume}%";
      format-bluetooth = "{volume}% {icon} {format_source}";
      format-bluetooth-muted = " {icon} {format_source}";
      format-muted = " {format_source}";
      format-source = "{volume}% ";
      format-source-muted = "";
      format-icons = {
        headphone = " ";
        hands-free = " ";
        headset = " ";
        phone = " ";
        portable = " ";
        car = " ";
        default = [
          ""
          ""
          ""
        ];
      };
      on-click = "pavucontrol";
    };

  };
}
