{
  pkgs,
  ...
}:{
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${import ../../derivations/sddm-themes/sugar-dark.nix {inherit pkgs;}}";
    };

    defaultSession = "hyprland";
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
  ];
}
