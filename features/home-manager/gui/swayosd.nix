{
  config,
  # pkgs,
  ...
}:let 
  monitorName = with builtins; (head (filter (m: m.primary) config.monitors)).name;
in {
  services.swayosd = {
    enable = true;
    topMargin = 0.8;
    # display = "${monitorName}";
   };

}
