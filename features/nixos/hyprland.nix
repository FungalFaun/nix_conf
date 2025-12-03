{
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    withUWSM = false;
  };

  environment.systemPackages = [
    pkgs.kitty
  ];

  security.pam.services.hyprlock = {};
}
