# https://github.com/Alexays/Waybar/
{
  pkgs,
  ...
}: {
  systemd.user.services.waybar = {
    # I think this was to set how many retries to do at startup
    Unit.StartLimitBurst = 30;
  };

  imports = [
    ./modules.nix
  ];

  home.packages = with pkgs; [
    nerd-fonts.roboto-mono
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
          "idle_inhibitor"
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
