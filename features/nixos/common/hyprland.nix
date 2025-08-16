{
  pkgs,
  ...
}:let
  # cfg = config.programs.hypreco;
in {
  programs.hyprland = {
    enable = true;
    withUWSM = false;
  };

  environment.systemPackages = [
    pkgs.kitty
  ];

  # environment.sessionVariables = {
  #   NIXOS_OZONE_WL = 1;
  # };
}
