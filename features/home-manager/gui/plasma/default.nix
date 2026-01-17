{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    kdePackages.discover    
  ];
}
