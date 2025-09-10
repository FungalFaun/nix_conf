{
  pkgs,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland -c ${pkgs.nwg-hello}/hyprland.conf";
        # command = "Hyprland -c /etc/nwg-hello/hyprland.conf";
      };
    };
  };

  environment.pathsToLink = [
    "/share/wayland-sessions"
  ];
}
