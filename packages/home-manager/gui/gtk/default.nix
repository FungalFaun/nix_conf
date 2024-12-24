{
  pkgs,
  ...
}: let 
    gruvboxPlus = import ./gruvbox-plus.nix { inherit pkgs; };
    gruvboxGtk = import ./gruvbox-gtk.nix { inherit pkgs; };
in {
  home.file = {
    ".local/share/icons/GruvboxPlus".source = "${gruvboxPlus}";
    # ".local/share/themes/GruvboxGtk".source = "${gruvboxGtk}";
  };

  gtk = { 
    enable = true;

    theme = {
#      name = "Kanagawa-BL";
#      package = pkgs.kanagawa-gtk-theme;
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };

    cursorTheme = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
    };

    iconTheme = {
      name = "GruvboxPlus/Gruvbox-Plus-Dark";
      package = gruvboxPlus;
    };
  };

  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}

# To find the name for a package

# nix build nixpkgs#kanagawa-icon-theme
# cd result
# ls /share/icons
