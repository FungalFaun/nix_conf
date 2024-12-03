{
  ...
}: let
  # TODO: Set wallpaper image path
  imagePath = "$HOME/.config/";
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
