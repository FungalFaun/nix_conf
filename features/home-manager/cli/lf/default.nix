{
  pkgs,
  ...
}: {
  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = with pkgs; {
    enable = true;

    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

    previewer = {
      source = "${ctpv}/bin/ctpv";
      keybinding = "i";
    };
    
    extraConfig = ''
      &${ctpv}/bin/ctpv -s $id
      cmd on-quit %${ctpv}/bin/cptv -e $id
      set cleaner ${ctpv}/bin/cptvclear
    '';

    keybindings = {
      dd = "delete";
      p = "paste";
      x = "cut";
      y = "copy";
      
    };
  };
}
