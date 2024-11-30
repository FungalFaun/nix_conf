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
  ];

  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
  };
}
