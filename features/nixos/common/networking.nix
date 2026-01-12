{
  pkgs,
  ...
}: {
  networking.networkmanager.enable = true;

  environment.systemPackages = [
    pkgs.protonvpn-gui
    pkgs.networkmanagerapplet
  ];
}
