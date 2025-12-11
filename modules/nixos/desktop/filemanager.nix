{
  pkgs,
  ...
}: {
  programs = {
    thunar = {
      enable = true;

      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

    gnome-disks.enable = true;
  };
}