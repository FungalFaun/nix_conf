{
  ...
}: {
  systemd.user.services.waybar = {
    # I think this was to set how many retries to do at startup
    Unit.StartLimitBurst = 30;
  };

  programs.waybar = {
    enable = true;

    systemd.enable = true;

  };
}
