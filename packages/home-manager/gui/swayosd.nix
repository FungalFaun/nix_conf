{
  config,
  ...
}:let 
  monitorName = with builtins; (head (filter (m: m.primary) config.monitors)).name;
in {
  services.swayosd = {
    enable = true;
    topMargin = 0.8;
    display = "${monitorName}";
   };

  systemd.services.swayosd-server = {
    enable = false;
    description = "SwayOSD Server for the frontend";
    documentation = [ "https://github.com/ErikReider/SwayOSD" ];
    wantedBy = [ "graphical.target" ];
    partOf = [ "graphical.target" ];
    after = [ "graphical.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.swayosd}/bin/swayosd-server";
    };
  };
}
