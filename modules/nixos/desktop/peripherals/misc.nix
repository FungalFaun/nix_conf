{
  pkgs,
  ...
}: {
  services = {
    printing.enable = true;

    udev.packages = with pkgs; [
      gnome-settings-deamon
    ];
  };
}