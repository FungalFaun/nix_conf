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
      thunar-archive-plugin
      thunar-media-tags-plugin

    ];
  };

  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    tumbler.enable = true;
  };
}
