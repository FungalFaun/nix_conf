{
  pkgs,
  ...
}:{
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      # autoNumlock = true;
      #theme = "${import ../../derivations/sddm-themes/sugar-dark.nix {inherit pkgs;}}";
    };

    # This could be slightly wrong
    defaultSession = "hyprland";
  };

  environment.systemPackages = with pkgs; [
  #   sddm-sugar-dark
  #   sddm-astronaut

    # libsForQt5.qt5
    #libsForQt5.qt5.qtquickcontrols2
    ##libsForQt5.qt5.qtsvg

    #kdePackages.qt5compat
    ##kdePackages.qtquickcontrols2
    ##kdePackages.qtgraphicaleffects
    #kdePackages.qtsvg
    
    hyprland-qt-support
  ];
}
