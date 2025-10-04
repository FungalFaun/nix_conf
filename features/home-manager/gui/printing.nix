{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    LycheeSlicer
    bambu-studio
  ];

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      # Add bambu-studio version
    ];
  };
}
