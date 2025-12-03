# https://docs.xfce.org/xfce/thunar/archive
{
  pkgs,
  ...
}:{
  programs = {
    thunar.plugins = with pkgs.xfce; [ 
      # TODO Configure archive manager
      thunar-archive-plugin
      thunar-media-tags-plugin
    ];

    gnome-disks.enable = true;
  };
}
