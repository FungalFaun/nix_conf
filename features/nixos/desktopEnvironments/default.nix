{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;
  cfg = config.desktopEnv.environment;
in {
  imports = [
    ./gnome.nix
    ./hyprland.nix
    ./kde.nix
  ];

  options.desktopEnv.environment = lib.mkOption {
    type = lib.types.enum [
      "gnome"
      "kde"
      "hyprland"
    ];
    default = "gnome";
    description = "Set desktop environment";
  };

  config.desktopEnv = {
    gnome.enable = mkIf (cfg == "gnome") true;
    kde.enable = mkIf (cfg == "kde") true;
    hyprland.enable = mkIf (cfg == "hyprland") true;
  };
}