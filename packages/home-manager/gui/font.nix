{pkgs, ...}: let
  inconsolata = pkgs.nerdfonts.override { fonts = ["Inconsolata"]; };
in {
  fontProfiles = {
    enable = true;
    monospace = {
      family = "Inconsolata Nerd Font";
      package = inconsolata;
    };
    regular = {
      family = "Inconsolata Nerd Font";
      package = inconsolata;
    };
  };
}
