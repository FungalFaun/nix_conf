{
  services = {
    cliphist = {
      enable = true;
      systemdTargets = [
        "hyprland-session.target"
        #"graphical-session.target"
        #"wayland-session@hyprland.desktop.target"
      ];
    };

    
  };
}
