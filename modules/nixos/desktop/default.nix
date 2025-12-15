{
  config,
  lib,
  ...
}: let
  cfg = config.modules.desktop;
in {
  imports = [] ++ (lib.optionals cfg.enable [
    ./periferals
    
    ./filemanager.nix
    ./gaming.nix
    ./misc.nix
    ./security.nix
    ./xdg.nix
  ]);

  options.modules.desktop = {
    
    # enable = lib.mkEnableOption "Enables the desktop and programs which require a gui";
  };

  config = {};
}
