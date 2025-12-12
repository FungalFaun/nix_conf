{
  pkgs, 
  ...
}: let
  inconsolata = pkgs.nerd-fonts.inconsolata;
in {
  home.packages = with pkgs; [
    nerd-fonts.inconsolata
  ];

  fonts.fontconfig.enable = true;

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
