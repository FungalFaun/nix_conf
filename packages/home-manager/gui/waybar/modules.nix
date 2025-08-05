# [1] https://github.com/woioeow/hyprland-dotfiles/
{
  programs.waybar.settings.mainBar = {
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
      bat = "BAT0";
      interval = 20;
      states = {
          warning = 30;
          critical = 20;
      };
      format = "{icon}";
      format-icons = ["" "" "" "" ""];
      tooltip-format = "{capacity}%";
      max-length = 20;
    };

    cpu = {
      format = "{icon}";
      format-icons = [
        "<span color='#69ff94'>▁</span>"
        "<span color='#2aa9ff'>▂</span>"
        "<span color='#f8f8f2'>▃</span>"
        "<span color='#f8f8f2'>▄</span>"
        "<span color='#ffffa5'>▅</span>"
        "<span color='#ffffa5'>▆</span>"
        "<span color='#ff9977'>▇</span>"
        "<span color='#dd532e'>█</span>"
      ];
      tooltip = true;
      tooltip-format = "{usage}%";
    };

    backlight = {
      #device = "intel_backlight";
      format = "<span color='#FFD700'>{icon}</span>";
      tooltip = true;
      tooltip-format = "{percent}%";
      format-icons = [
        "<span color='#696969'>󰃞</span>" 
        "<span color='#A9A9A9'>󰃝</span>"
        "<span color='#FFFF66'>󰃟</span>"
        "<span color='#FFD700'>󰃠</span>"
      ];
    };

    #bluetooth = {
    #  format = "";
    #  format-disabled = "󰂲";
    #  format-off = "󰂲";
    #  format-on = "";
    #  format-connected = "";
    #  #format-no-controller = " no controller";
    #  #format-connected-battery = " {device_alias} {device_battery_percentage}%";
    #  #"format-device-preference": [ "device1", "device2" ], // preference list deciding the displayed device
    #  tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
    #  tooltip-format-connected = "{device_enumerate}";
    #  tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
    #  #tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
    #};

    # [1]
    bluetooth = {
      format = "<span color='#00BFFF'>  </span>";
      format-connected = "<span color='#00BFFF'>  </span>";
      tooltip-format = "{num_connections} connected";
      tooltip-format-connected = "{num_connections} connected\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
      #tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
    };

    #network = {
    #  interface = "wlo1";
    #  format = "{ifname}";
    #  format-wifi = "{essid} ({signalStrength}%) ";
    #  format-ethernet = "{ipaddr}/{cidr} 󰊗";
    #  format-disconnected = ""; # An empty format will hide the module;
    #  tooltip-format = "{ifname} via {gwaddr} 󰊗";
    #  tooltip-format-wifi = "{essid} ({signalStrength}%) ";
    #  tooltip-format-ethernet = "{ifname} ";
    #  tooltip-format-disconnected = "Disconnected";
    #  max-length = 50;
    #};

    idle_inhibitor = {
      format = "{icon}";
      format-icons = {
        activated = " ";
        deactivated = " ";
      };
    };

    # [1]
    network = let
      controller = "wlp9s0";
    in {
      format = "<span color='#00FFFF'>󰤨 </span>{essid}";
      format-wifi = "<span color='#00FFFF'>󰤨 </span>{essid}";
      format-ethernet = "<span color='#7FFF00'> </span>Wired";
      tooltip-format = "<span color='#FF1493'>󰅧  </span>{bandwidthUpBytes}  <span color='#00BFFF'> 󰅢  </span>{bandwidthDownBytes}";
      format-linked = "<span color='#FFA500'>󱘖  </span>{ifname} (No IP)";
      format-disconnected = "<span color='#FF4040'> </span>Disconnected";
      format-alt = "<span color='#00FFFF'>󰤨 </span>{signalStrength}%";
      interval = 1;
      on-click = "nmcli device connect ${controller}; hyprctl notify 1 1000 0 ''Connected''";
      on-click-right = "nmcli device disconnect ${controller}; hyprctl notify 1 1000 0 ''Disconnected''";
    };

    # [1]
    pulseaudio = {
      format = "<span color='#00FF7F'>{icon} </span>{volume}%";
      format-muted = "<span color='#FF4040'>󰖁</span>0%";
      format-icons = {
        #headphone = "<span color='#BF00FF'>  </span>";
        #hands-free = "<span color='#BF00FF'>  </span>";
        #headset = "<span color='#BF00FF'>  </span>";
        #phone = "<span color='#00FFFF'>  <.get_default();/span>";
        #portable = "<span color='#00FFFF'>  </span>";
        #car = "<span color='#FFA500'>  </span>";
        default = [
          "<span color='#808080'> </span>"
          "<span color='#FFFF66'> </span>"
          "<span color='#00FF7F'>  </span>"
        ];
      };
      on-click-right = "pavucontrol -t 3";
      on-click = "pactl -- set-sink-mute 0 toggle";
      tooltip = true;
      tooltip-format = "{volume}%";
    };

    "hyprland/workspaces" = {
      format = "{icon}";
      format-icons = {
        active = "";
        #default = "";
        default = "";
      };
    };

    "custom/power" = {
      format = "<span color='#FF4040'>   </span>";
      on-click = "systemctl poweroff";
      on-click-right = "systemctl reboot";
      tooltip = true;
      tooltip-format = "Power";
    };
  };
}
