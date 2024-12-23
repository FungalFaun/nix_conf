{
  pkgs,
  ...
}: let 
    gruvboxPlus = import ./gruvbox-plus.nix { inherit pkgs; };
in {
  home.file = {
    ".local/share/icons/GruvboxPlus".source = "${gruvboxPlus}";
  };

  gtk = { 
    enable = true;

    theme = {
#      name = "adw-gtk3";
#      package = pkgs.adw-gtk3;
      name = "Kanagawa-BL";
      package = pkgs.kanagawa-gtk-theme;
    };

    cursorTheme = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
    };

    iconTheme = {
      name = "GruvboxPlus/Gruvbox-Plus-Dark";
      package = gruvboxPlus;
#      name = "Kanagawa";
#      package = pkgs.kanagawa-icon-theme;
    };
  };

  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}

# To find the name for a package

# nix build nixpkgs#kanagawa-icon-theme
# cd result
# ls /share/icons
