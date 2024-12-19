{
  ...
}: let
  # TODO: Set wallpaper image path
  imagePath = "$HOME/.config/home-manager-nixvim/assets/wallpaper/attic.jpg";
  # imagePath = "$SRC_PATH/assets/wallpaper/$WALLPAPER";
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
