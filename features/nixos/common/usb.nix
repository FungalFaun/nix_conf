{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    usbutils
    udiskie
    udisks
    gvfs
    ntfs3g
  ];

  programs = {
    thunar.plugins = with pkgs.xfce; [ 
      # TODO Configure archive manager
      thunar-archive-plugin
      thunar-media-tags-plugin
      # thunar-volman
    ];

    gnome-disks.enable = true;
  };

  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    tumbler.enable = true;
  };
}
