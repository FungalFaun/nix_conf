{
  pkgs,
  ...
}: {
  services.xserver.videoDrivers = ["amdgpu"];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    enableAllFirmware = true;
  };

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gamemode = {
      enable = true;
      settings = {
        general = {
          softrealtime = "on";
          inhibit_screensaver = 1;
          # renice = 0; ?
        };

        # gpu = {
        #   # The number in "/sys/class/drm/card0/"
        #   gpu_device = 0;
        # };
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      mangohud
      protontricks
    ];
    
    # sessionVariables = {
    #   STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    # };
  };
}
