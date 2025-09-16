# https://github.com/vimjoyer/nixos-gaming-video
{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.programs.gaming;
in {
  options.programs.gaming = {
    enable = lib.mkEnableOption "Enable gaming";
  };

  config = lib.mkIf cfg.enable {

    home.packages = with pkgs; [
      # protonup
      # mangohud
    ];

    home.sessionVariables = {
      # STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };
}
