{
  pkgs, 
  inputs,
  ...
}: let
  #inconsolata = pkgs.nerd-fonts.inconsolata;
  #inconsolata = pkgs.inconsolata-nerdfont;
  inconsolata = inputs.nixpkgs-stable.legacyPackages."x86_64-linux".nerdfonts.override { fonts = [ "Inconsolata" ];};
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
