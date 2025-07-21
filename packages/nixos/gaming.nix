{
  pkgs,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = false;
      nvidiaSettings = true;
    };
  };

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gamemode.enable = true;
  };

  environment = {
    systemPackages = [
      pkgs.mangohud
    ];
    
    # sessionVariables = {
    #   STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    # };
  };
}
