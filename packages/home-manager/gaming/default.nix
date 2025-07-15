# https://github.com/vimjoyer/nixos-gaming-video
{
  pkgs,
  lib,
  cfg,
  ...
}: {
  options.programs.gaming = {
    enable = lib.mkEnableOption "Enable gaming";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      protonup
      mangohud
    ];

    programs = {
      steam = {
        enable = true;
        # TODO Check if this was necessary or optional
        gamescopeSession = true;
      };

      gamemode.enable = true;
    };

    home.sessionVariables = {
      # TODO Find real path
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };
}
