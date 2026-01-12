{
  services = {
    xserver.enable = false;

    # Login manager
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    
    # Desktop environment
    desktopManager.plasma6 = {
      enable = true;
      enableQt5Integration = true;
    };
  };
}