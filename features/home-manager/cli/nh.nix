{
  config,
  ...
}:{
  programs.nh = {
    enable = true;
    flake = "${config.xdg.configHome}/home-manager";

    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };
}
