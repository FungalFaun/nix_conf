{
  pkgs,
  ...
}:{
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };

    cursorTheme = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
    };

    iconTheme = {
      package = pkgs.gruvbox-dark-icons-gtk;
      name = "gruvbox-dark-icons-gtk";
    };
  };

  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
