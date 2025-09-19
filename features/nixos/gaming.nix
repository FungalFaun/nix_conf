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
          inhibit_screensaver = 1;
        };
        
        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 0; # ?
          amd_performance_level = "high";
        };
      };
    };
  };
}
