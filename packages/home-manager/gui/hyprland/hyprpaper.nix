{
config,
  ...
}: let
  # TODO: Set wallpaper image path
  flakePath = "${config.xdg.configHome}/home-manager";
  imagePath = "${flakePath}/assets/wallpaper/${config.wallpaper}";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = true;
      splash = false;

      preload = [
        "${imagePath}"
      ];

      wallpaper = [
        "eDP-1, ${imagePath}"
      ];
    };
  };
}
