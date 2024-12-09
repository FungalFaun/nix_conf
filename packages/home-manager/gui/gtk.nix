{
  pkgs,
  ...
}:{
  gtk = let 
    gruvboxPlus = import ../../../derivations/icon-themes/gruvbox-plus.nix { inherit pkgs; };
  in {
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
      package = gruvboxPlus;
      name = "gruvbox-plus";
    };
  };

  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
