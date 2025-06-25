{
  pkgs,
  ...
}:{
  imports = [
    ./astal.nix
  ];

  home.packages = with pkgs; [
    imagemagick
    ghostscript
    mermaid-cli
  ];

  programs = {
    fd.enable = true;
    kitty.enable = true;
  };
}
