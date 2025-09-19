{
  pkgs,
  lib,
  config,
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

  environment = {
    systemPackages = [
      pkgs.protonup
    ];

    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };

  programs = {
    steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
        args = let
          monitor = {
            width = "2560";
            height = "1440";
            refreshRate = "90";
            name = "DP-1";
          };
        in [
          "--output-width ${monitor.width}"
          "--output-height ${monitor.height}"
          "--framerate-limit ${monitor.refreshRate}"
          "--prefer-output ${monitor.name}"
          "--adaptive-sync"
          "--expose-wayland"
          "--hdr-enabled"
          "--mangoapp"
        ];
      };

      protontricks.enable = true;
    };

    gamemode = {
      enable = true;
      settings = {
        general = {
          softrealtime = "on";
          inhibit_screensaver = 1;
          # renice = 0; ?
        };

        gpu = {
          # The number in "/sys/class/drm/card{0-9}/"
          gpu_device = 1;
          apply_gpu_optimisations = "accept-responsibility";
          amd_performance_level = "high";
        };
      };
    };
  };
}
