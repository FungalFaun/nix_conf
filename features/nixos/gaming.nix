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

  environment = {
    systemPackages = with pkgs; [
      mangohud
      protontricks
    ];
  };
}
