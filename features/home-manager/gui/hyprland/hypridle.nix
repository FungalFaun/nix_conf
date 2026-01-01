{
  ...
}: {
  services.hypridle = {
    enable = true;
    settings = let
      # TODO: Double check this
      isDischarging = "grep Discharging /sys/class/power_supply/BAT{0,1}/status -q";
    in {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };

      listener = [
        # Dim screen
        {
          timeout = 5 * 60;
          on-timeout = "brightnessctl --save set 1%";
          on-resume = "brightnessctl --restore";
        }
        # Turn off keyboard backlight
        {
          timeout = 5 * 60;
          on-timeout = "brightnessctl --device='white:kbd_backlight' --save set 0";
          on-resume = "brightnessctl --device='white:kbd_backlight' --restore";
        }
        # Turn off screen
        {
          timeout = 10 * 60;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        # Hibernate
        {
          timeout = 15 * 60;
          on-timeout = "systemctl suspend";
        }

        # TODO: Check before use
        # {
        #   timeout = 900;
        #   on-timeout = "if ${isDischarging}; then systemctl suspend; fi";
        # }
      ];
    };
  };
}
