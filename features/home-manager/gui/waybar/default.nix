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
    ./themes/config.nix
  ];

  home.packages = with pkgs; [
    nerd-fonts.roboto-mono
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;


    # settings = {
    #   mainBar = {
    #     layer = "top";
    #     margin-top = 0;
    #     margin-bottom = 0;
    #     margin-left = 0;
    #     margin-right = 0;
    #     spacing = 0;
    #
    #     modules-left = [
    #       "hyprland/workspaces"
    #     ];
    #
    #     modules-center = ["clock"];
    #     modules-right = [
    #       "idle_inhibitor"
    #       "network"
    #       "bluetooth"
    #       "pulseaudio"
    #       "backlight"
    #       "battery"
    #       "custom/power"
    #     ];
    #
    #   };
    # };
  };
}
