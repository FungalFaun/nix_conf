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
}
