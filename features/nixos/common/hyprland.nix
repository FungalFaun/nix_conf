{
  pkgs,
  ...
}:let
  # cfg = config.programs.hypreco;
in {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  environment.systemPackages = [
    pkgs.kitty
  ];

  # environment.sessionVariables = {
  #   NIXOS_OZONE_WL = 1;
  # };
}
