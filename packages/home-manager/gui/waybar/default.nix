# https://github.com/Alexays/Waybar/
{
  ...
}: {
  systemd.user.services.waybar = {
    # I think this was to set how many retries to do at startup
    Unit.StartLimitBurst = 30;
  };

  imports = [
    ./modules.nix
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    #style = ./styles.css;

    settings = {
      mainBar = {
        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = ["clock"];
        modules-right = [
          "network"
          "bluetooth"
          "pulseaudio"
          "backlight"
          "battery"
          "custom/power"
        ];

      };
    };
  };
}
