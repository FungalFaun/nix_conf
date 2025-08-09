{
  ...
}: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };

      listener = let
        #notify-send = lib.getExe' pkgs.libnotify "notify-send";
      in [
        # Dim screen
        {
          timeout = 5 * 60;
          on-timeout = "brightnessctl get > backlight; brightnessctl set 1%";
          on-resume = "brightnessctl set $(cat ./backlight); rm ./backlight";
        }
        # Turn off keyboard backlight
        {
          timeout = 5 * 60;
          on-timeout = "brightnessctl --device='white:kbd_backlight' get > kbd_backlight; brightnessctl --device='white:kbd_backlight' set 0";
          on-resume = "brightnessctl --device='white:kbd_backlight' set $(cat ./kbd_backlight); rm ./kbd_backlight";
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
          on-timeout = "systemctl suspend-then-hibernate";
        }
      ];
    };
  };
}
